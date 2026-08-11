import 'package:supabase_flutter/supabase_flutter.dart';
import 'database.dart';
import 'package:drift/drift.dart';

class SyncService {
  final AppDatabase database;
  SyncService(this.database);

  final _supabase = Supabase.instance.client;

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