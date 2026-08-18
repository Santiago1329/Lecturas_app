import 'package:drift/drift.dart';

class Rutas extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nombre => text()();
  TextColumn get estado => text().withDefault(const Constant('pendiente'))(); // pendiente | en_progreso | completa
  TextColumn get remoteId => text().nullable()(); // id que le asigno Supabase, null hasta que se sincroniza
}

class Lecturas extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get rutaId => integer().references(Rutas, #id)();
  TextColumn get medidor => text()();
  TextColumn get direccion => text()();
  RealColumn get valorAnterior => real()();
  RealColumn get valorActual => real().nullable()();
  TextColumn get observacion => text().withDefault(const Constant(''))();
  BoolColumn get sincronizada => boolean().withDefault(const Constant(false))();
  TextColumn get remoteId => text().nullable()();
}