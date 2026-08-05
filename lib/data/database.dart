import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'tables.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Rutas, Lecturas])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      // Dispositivo nuevo: crea todas las tablas
      await m.createAll();
    },
    onUpgrade: (Migrator m, int from, int to) async {
      // Ya existe la BD, se agrega la tabla faltante
      if (from < 2) {
        await m.createTable(lecturas);
      }
    },
  );
}

QueryExecutor _openConnection() {
  return driftDatabase(
    name: 'rutas_db',
    web: DriftWebOptions(
      sqlite3Wasm: Uri.parse('sqlite3.wasm'),
      driftWorker: Uri.parse('drift_worker.js'),
    ),
  );
}