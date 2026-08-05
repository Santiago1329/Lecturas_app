import 'package:drift/drift.dart';

class Rutas extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nombre => text()();
  TextColumn get valorGuardado => text().nullable()();
}

class Lecturas extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get rutaId => integer().references(Rutas, #id)();
  TextColumn get medidor => text()();
  TextColumn get direccion => text()();
  RealColumn get valorAnterior => real()();
  RealColumn get valorActual => real().nullable()();
  TextColumn get observacion => text().withDefault(const Constant(''))();
}