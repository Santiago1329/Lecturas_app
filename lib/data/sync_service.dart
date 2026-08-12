import 'package:supabase_flutter/supabase_flutter.dart';
import 'database.dart';
import 'package:drift/drift.dart';

class SyncService {
  final AppDatabase database;
  SyncService(this.database);

  final _supabase = Supabase.instance.client;

  // Busca rutas nuevas asiganadas al lector sin descargar, las descarga y guarda localmente
  // Devuelve true si descargo algo y false si no habia nada o fallo por conexion
  Future<bool> descargarRutaAsignada(String lectorId) async {
    try {
      final rutaRemota = await _supabase
        .from('rutas')
        .select()
        .eq('lector_id', lectorId)
        .eq('descargada', false)
        .maybeSingle();

      if (rutaRemota == null) return false;

      // Verifica que la ruta no este localmente
      final yaExisteLocal = await (database.select(database.rutas)
        ..where((r) => r.remoteId.equals(rutaRemota['id'].toString())))
        .getSingleOrNull();
      
      if (yaExisteLocal != null) return false;

      final medidoresRemotos = await _supabase
        .from('medidores')
        .select()
        .eq('ruta_id', rutaRemota['id'])
        .order('orden_visita');
      
      // Se guarda la ruta localmente
      final rutaLocalId = await database.into(database.rutas).insert(
        RutasCompanion.insert(
          nombre: rutaRemota['nombre'] ?? 'Ruta sin nombre',
          estado: const Value('pendiente'),
          remoteId: Value(rutaRemota['id'].toString()),
        ),
      );

      // Se guarda cada medidor como una fila de lecturas local con valorActual vacio (para el lector)
      for (final medidor in medidoresRemotos) {
        await database.into(database.lecturas).insert(
          LecturasCompanion.insert(
            rutaId: rutaLocalId, 
            medidor: medidor['medidor'], 
            direccion: medidor['direccion'], 
            valorAnterior: (medidor['valorAnterior'] as num).toDouble(),
          ),
        );
      }

      // Marcamos en supabase que la ruta ya se descargo
      await _supabase
        .from('rutas')
        .update({'descargada': true})
        .eq('id', rutaRemota['id']);
      
      return true;
    } catch (e) {
      print('Error al descargar: $e');
      return false;
    }
  }

  // Marca la ruta como completa localmente, funciona en cualquier momento
  Future<void> marcarRutaCompleta(int rutaId) async {
    await (database.update(database.rutas)..where((r) => r.id.equals(rutaId)))
      .write(const RutasCompanion(estado: Value('completa')));
  }

  // Intenta subir todas las rutas que esten completas (sin remoteId), si falla no sincroniza y deja reintentar luego
  Future<bool> sincronizarPendientes() async {
    final rutasPendientes = await (database.select(database.rutas)
      ..where((r) => 
        r.estado.equals('completa') & r.remoteId.isNull()))
      .get();

    if (rutasPendientes.isEmpty) return true;

    try {
      for (final ruta in rutasPendientes) {
        final rutaInsertada = await _supabase
          .from('rutas')
          .insert({'nombre': ruta.nombre, 'estado': 'completa'})
          .select()
          .single();

        final remoteId = rutaInsertada['id'].toString();

        final lecturasPendientes = await (database.select(database.lecturas)
          ..where((l) =>
            l.rutaId.equals(ruta.id) & l.sincronizada.equals(false)))
          .get();

        if (lecturasPendientes.isNotEmpty) {
          await _supabase.from('lecturas').insert(
            lecturasPendientes.map((l) => {
              'ruta_id': remoteId,
              'medidor': l.medidor,
              'direccion': l.direccion,
              'valor_anterior': l.valorAnterior,
              'valor_actual': l.valorActual,
              'observacion': l.observacion,
            }).toList(),
          );

          for (final l in lecturasPendientes) {
            await (database.update(database.lecturas)
              ..where((row) => row.id.equals(l.id)))
              .write(const LecturasCompanion(sincronizada: Value(true)));
          }
        }

        await (database.update(database.rutas)
          ..where((r) => r.id.equals(ruta.id)))
          .write(RutasCompanion(remoteId: Value(remoteId)));
      }
      return true;
    } catch (e) {
      // Sin conexion o fallo en la red
      return false;
    }
  } 
}