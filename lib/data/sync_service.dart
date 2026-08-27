import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:convert';
import 'database.dart';
import 'package:drift/drift.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:flutter/foundation.dart';

class SyncService {
  final AppDatabase database;
  SyncService(this.database);

  final _supabase = Supabase.instance.client;

  // Busca rutas nuevas asiganadas al lector sin descargar, las descarga y guarda localmente
  // Devuelve true si descargo algo y false si no habia nada o fallo por conexion
  Future<bool> descargarRutaAsignada(String lectorId) async {
    try {
      final rutasRemotas = await _supabase
        .from('rutas')
        .select()
        .eq('lector_id', lectorId)
        .eq('descargada', false)
        .order('id')
        .limit(1);

      if (rutasRemotas.isEmpty) return false;
      final rutaRemota = rutasRemotas.first;

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
          estado: const Value('en_progreso'),
          remoteId: Value(rutaRemota['id'].toString()),
          opcionesNlLc: Value(
            rutaRemota['opciones_nl_lc'] != null
              ? jsonEncode(rutaRemota['opciones_nl_lc'])
              : null,
          ),
        ),
      );

      // Se guarda cada medidor como una fila de lecturas local con valorActual vacio (para el lector)
      for (final medidor in medidoresRemotos) {
        await database.into(database.lecturas).insert(
          LecturasCompanion.insert(
            rutaId: rutaLocalId,
            codigo: medidor['codigo'],
            nombreCliente: Value(medidor['nombre_cliente'] as String?),
            direccion: Value(medidor['direccion'] as String?),
            remoteId: Value(medidor['id'].toString()),
            lectAnt: Value((medidor['lect_ant'] as num?)?.toDouble()),
            consAnt: Value((medidor['cons_ant'] as num?)?.toDouble()),
            lectAct: Value((medidor['lect_act'] as num?)?.toDouble()),
            consAct: Value((medidor['cons_act'] as num?)?.toDouble()),
            descripcion: Value(medidor['descripcion'] as String?),
            promedio: Value((medidor['promedio'] as num?)?.toDouble()),
            serie: Value(medidor['serie'] as String?),
            lectRev: Value((medidor['lect_rev'] as num?)?.toDouble()),
          ),
        );
      }

      // Marcamos en supabase que la ruta ya se descargo
      await _supabase
        .from('rutas')
        .update({
          'descargada': true,
          'estado': 'en_progreso'
        })
        .eq('id', rutaRemota['id']);
      
      return true;
    } catch (e) {
      debugPrint('Error al descargar: $e');
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
      ..where((r) => r.estado.equals('completa')))
      .get();

    if (rutasPendientes.isEmpty) return true;

    try {
      for (final ruta in rutasPendientes) {
        String remoteId;

        if (ruta.remoteId != null) {
          remoteId = ruta.remoteId!;
          await _supabase
            .from('rutas')
            .update({'estado': 'completa'})
            .eq('id', remoteId);
        } else {
          final rutaInsertada = await _supabase
            .from('rutas')
            .insert({'nombre': ruta.nombre, 'estado': 'completa'})
            .select()
            .single();
          remoteId = rutaInsertada['id'].toString();

          await (database.update(database.rutas)
            ..where((r) => r.id.equals(ruta.id)))
            .write(RutasCompanion(remoteId: Value(remoteId)));
        }

        final lecturasPendientes = await (database.select(database.lecturas)
          ..where((l) =>
            l.rutaId.equals(ruta.id) & l.sincronizada.equals(false)))
          .get();

        for (final l in lecturasPendientes) {
          await _supabase.from('medidores').update({
            'lect_rev': l.lectRev,
            'nl_lc': l.nlLc,
            'observacion': l.observacion,
          }).eq('id', l.remoteId!);

          await (database.update(database.lecturas)
            ..where((row) => row.id.equals(l.id)))
            .write(const LecturasCompanion(sincronizada: Value(true)));
        }
      }
      return true;
    } catch (e) {
      // Sin conexion o fallo en la red
      debugPrint('Error al descargar: $e');
      return false;
    }
  }

  void escucharConectividad() {
    Connectivity().onConnectivityChanged.listen((results) {
      final hayConexion = results.any((r) => r != ConnectivityResult.none);
      if (hayConexion) {
        sincronizarPendientes();
      }
    });
  }
}