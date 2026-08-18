import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'tables.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Rutas, Lecturas])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 4;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) => m.createAll(),
    onUpgrade: (Migrator m, int from, int to) async {
      if (from < 3) {
        await m.addColumn(rutas, rutas.estado);
        await m.addColumn(rutas, rutas.remoteId);
        await m.addColumn(lecturas, lecturas.sincronizada);
      }
      if (from < 4) {
        await m.addColumn(lecturas, lecturas.remoteId);
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