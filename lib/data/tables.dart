import 'package:drift/drift.dart';

class Rutas extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nombre => text()();
  TextColumn get estado => text().withDefault(const Constant('pendiente'))();
  TextColumn get remoteId => text().nullable()();
  TextColumn get opcionesNlLc => text().nullable()(); // JSON string
}

class Lecturas extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get rutaId => integer().references(Rutas, #id)();
  TextColumn get codigo => text()();
  TextColumn get nombreCliente => text().nullable()();
  TextColumn get direccion => text().nullable()();
  RealColumn get lectAnt => real().nullable()();
  RealColumn get consAnt => real().nullable()();
  RealColumn get lectAct => real().nullable()();
  RealColumn get consAct => real().nullable()();
  TextColumn get descripcion => text().nullable()();
  RealColumn get promedio => real().nullable()();
  TextColumn get serie => text().nullable()();
  RealColumn get lectRev => real().nullable()(); //editable
  TextColumn get nlLc => text().nullable()(); // editable
  TextColumn get observacion => text().withDefault(const Constant(''))(); // editable
  BoolColumn get sincronizada => boolean().withDefault(const Constant(false))();
  TextColumn get remoteId => text().nullable()();
}