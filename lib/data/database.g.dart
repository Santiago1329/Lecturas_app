// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $RutasTable extends Rutas with TableInfo<$RutasTable, Ruta> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RutasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nombreMeta = const VerificationMeta('nombre');
  @override
  late final GeneratedColumn<String> nombre = GeneratedColumn<String>(
    'nombre',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valorGuardadoMeta = const VerificationMeta(
    'valorGuardado',
  );
  @override
  late final GeneratedColumn<String> valorGuardado = GeneratedColumn<String>(
    'valor_guardado',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, nombre, valorGuardado];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'rutas';
  @override
  VerificationContext validateIntegrity(
    Insertable<Ruta> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nombre')) {
      context.handle(
        _nombreMeta,
        nombre.isAcceptableOrUnknown(data['nombre']!, _nombreMeta),
      );
    } else if (isInserting) {
      context.missing(_nombreMeta);
    }
    if (data.containsKey('valor_guardado')) {
      context.handle(
        _valorGuardadoMeta,
        valorGuardado.isAcceptableOrUnknown(
          data['valor_guardado']!,
          _valorGuardadoMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Ruta map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Ruta(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      nombre: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nombre'],
      )!,
      valorGuardado: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}valor_guardado'],
      ),
    );
  }

  @override
  $RutasTable createAlias(String alias) {
    return $RutasTable(attachedDatabase, alias);
  }
}

class Ruta extends DataClass implements Insertable<Ruta> {
  final int id;
  final String nombre;
  final String? valorGuardado;
  const Ruta({required this.id, required this.nombre, this.valorGuardado});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nombre'] = Variable<String>(nombre);
    if (!nullToAbsent || valorGuardado != null) {
      map['valor_guardado'] = Variable<String>(valorGuardado);
    }
    return map;
  }

  RutasCompanion toCompanion(bool nullToAbsent) {
    return RutasCompanion(
      id: Value(id),
      nombre: Value(nombre),
      valorGuardado: valorGuardado == null && nullToAbsent
          ? const Value.absent()
          : Value(valorGuardado),
    );
  }

  factory Ruta.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Ruta(
      id: serializer.fromJson<int>(json['id']),
      nombre: serializer.fromJson<String>(json['nombre']),
      valorGuardado: serializer.fromJson<String?>(json['valorGuardado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nombre': serializer.toJson<String>(nombre),
      'valorGuardado': serializer.toJson<String?>(valorGuardado),
    };
  }

  Ruta copyWith({
    int? id,
    String? nombre,
    Value<String?> valorGuardado = const Value.absent(),
  }) => Ruta(
    id: id ?? this.id,
    nombre: nombre ?? this.nombre,
    valorGuardado: valorGuardado.present
        ? valorGuardado.value
        : this.valorGuardado,
  );
  Ruta copyWithCompanion(RutasCompanion data) {
    return Ruta(
      id: data.id.present ? data.id.value : this.id,
      nombre: data.nombre.present ? data.nombre.value : this.nombre,
      valorGuardado: data.valorGuardado.present
          ? data.valorGuardado.value
          : this.valorGuardado,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Ruta(')
          ..write('id: $id, ')
          ..write('nombre: $nombre, ')
          ..write('valorGuardado: $valorGuardado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nombre, valorGuardado);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Ruta &&
          other.id == this.id &&
          other.nombre == this.nombre &&
          other.valorGuardado == this.valorGuardado);
}

class RutasCompanion extends UpdateCompanion<Ruta> {
  final Value<int> id;
  final Value<String> nombre;
  final Value<String?> valorGuardado;
  const RutasCompanion({
    this.id = const Value.absent(),
    this.nombre = const Value.absent(),
    this.valorGuardado = const Value.absent(),
  });
  RutasCompanion.insert({
    this.id = const Value.absent(),
    required String nombre,
    this.valorGuardado = const Value.absent(),
  }) : nombre = Value(nombre);
  static Insertable<Ruta> custom({
    Expression<int>? id,
    Expression<String>? nombre,
    Expression<String>? valorGuardado,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nombre != null) 'nombre': nombre,
      if (valorGuardado != null) 'valor_guardado': valorGuardado,
    });
  }

  RutasCompanion copyWith({
    Value<int>? id,
    Value<String>? nombre,
    Value<String?>? valorGuardado,
  }) {
    return RutasCompanion(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      valorGuardado: valorGuardado ?? this.valorGuardado,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nombre.present) {
      map['nombre'] = Variable<String>(nombre.value);
    }
    if (valorGuardado.present) {
      map['valor_guardado'] = Variable<String>(valorGuardado.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RutasCompanion(')
          ..write('id: $id, ')
          ..write('nombre: $nombre, ')
          ..write('valorGuardado: $valorGuardado')
          ..write(')'))
        .toString();
  }
}

class $LecturasTable extends Lecturas with TableInfo<$LecturasTable, Lectura> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LecturasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _rutaIdMeta = const VerificationMeta('rutaId');
  @override
  late final GeneratedColumn<int> rutaId = GeneratedColumn<int>(
    'ruta_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES rutas (id)',
    ),
  );
  static const VerificationMeta _medidorMeta = const VerificationMeta(
    'medidor',
  );
  @override
  late final GeneratedColumn<String> medidor = GeneratedColumn<String>(
    'medidor',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _direccionMeta = const VerificationMeta(
    'direccion',
  );
  @override
  late final GeneratedColumn<String> direccion = GeneratedColumn<String>(
    'direccion',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valorAnteriorMeta = const VerificationMeta(
    'valorAnterior',
  );
  @override
  late final GeneratedColumn<double> valorAnterior = GeneratedColumn<double>(
    'valor_anterior',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valorActualMeta = const VerificationMeta(
    'valorActual',
  );
  @override
  late final GeneratedColumn<double> valorActual = GeneratedColumn<double>(
    'valor_actual',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _observacionMeta = const VerificationMeta(
    'observacion',
  );
  @override
  late final GeneratedColumn<String> observacion = GeneratedColumn<String>(
    'observacion',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    rutaId,
    medidor,
    direccion,
    valorAnterior,
    valorActual,
    observacion,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'lecturas';
  @override
  VerificationContext validateIntegrity(
    Insertable<Lectura> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ruta_id')) {
      context.handle(
        _rutaIdMeta,
        rutaId.isAcceptableOrUnknown(data['ruta_id']!, _rutaIdMeta),
      );
    } else if (isInserting) {
      context.missing(_rutaIdMeta);
    }
    if (data.containsKey('medidor')) {
      context.handle(
        _medidorMeta,
        medidor.isAcceptableOrUnknown(data['medidor']!, _medidorMeta),
      );
    } else if (isInserting) {
      context.missing(_medidorMeta);
    }
    if (data.containsKey('direccion')) {
      context.handle(
        _direccionMeta,
        direccion.isAcceptableOrUnknown(data['direccion']!, _direccionMeta),
      );
    } else if (isInserting) {
      context.missing(_direccionMeta);
    }
    if (data.containsKey('valor_anterior')) {
      context.handle(
        _valorAnteriorMeta,
        valorAnterior.isAcceptableOrUnknown(
          data['valor_anterior']!,
          _valorAnteriorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_valorAnteriorMeta);
    }
    if (data.containsKey('valor_actual')) {
      context.handle(
        _valorActualMeta,
        valorActual.isAcceptableOrUnknown(
          data['valor_actual']!,
          _valorActualMeta,
        ),
      );
    }
    if (data.containsKey('observacion')) {
      context.handle(
        _observacionMeta,
        observacion.isAcceptableOrUnknown(
          data['observacion']!,
          _observacionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Lectura map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Lectura(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      rutaId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ruta_id'],
      )!,
      medidor: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}medidor'],
      )!,
      direccion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}direccion'],
      )!,
      valorAnterior: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}valor_anterior'],
      )!,
      valorActual: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}valor_actual'],
      ),
      observacion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}observacion'],
      )!,
    );
  }

  @override
  $LecturasTable createAlias(String alias) {
    return $LecturasTable(attachedDatabase, alias);
  }
}

class Lectura extends DataClass implements Insertable<Lectura> {
  final int id;
  final int rutaId;
  final String medidor;
  final String direccion;
  final double valorAnterior;
  final double? valorActual;
  final String observacion;
  const Lectura({
    required this.id,
    required this.rutaId,
    required this.medidor,
    required this.direccion,
    required this.valorAnterior,
    this.valorActual,
    required this.observacion,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['ruta_id'] = Variable<int>(rutaId);
    map['medidor'] = Variable<String>(medidor);
    map['direccion'] = Variable<String>(direccion);
    map['valor_anterior'] = Variable<double>(valorAnterior);
    if (!nullToAbsent || valorActual != null) {
      map['valor_actual'] = Variable<double>(valorActual);
    }
    map['observacion'] = Variable<String>(observacion);
    return map;
  }

  LecturasCompanion toCompanion(bool nullToAbsent) {
    return LecturasCompanion(
      id: Value(id),
      rutaId: Value(rutaId),
      medidor: Value(medidor),
      direccion: Value(direccion),
      valorAnterior: Value(valorAnterior),
      valorActual: valorActual == null && nullToAbsent
          ? const Value.absent()
          : Value(valorActual),
      observacion: Value(observacion),
    );
  }

  factory Lectura.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Lectura(
      id: serializer.fromJson<int>(json['id']),
      rutaId: serializer.fromJson<int>(json['rutaId']),
      medidor: serializer.fromJson<String>(json['medidor']),
      direccion: serializer.fromJson<String>(json['direccion']),
      valorAnterior: serializer.fromJson<double>(json['valorAnterior']),
      valorActual: serializer.fromJson<double?>(json['valorActual']),
      observacion: serializer.fromJson<String>(json['observacion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'rutaId': serializer.toJson<int>(rutaId),
      'medidor': serializer.toJson<String>(medidor),
      'direccion': serializer.toJson<String>(direccion),
      'valorAnterior': serializer.toJson<double>(valorAnterior),
      'valorActual': serializer.toJson<double?>(valorActual),
      'observacion': serializer.toJson<String>(observacion),
    };
  }

  Lectura copyWith({
    int? id,
    int? rutaId,
    String? medidor,
    String? direccion,
    double? valorAnterior,
    Value<double?> valorActual = const Value.absent(),
    String? observacion,
  }) => Lectura(
    id: id ?? this.id,
    rutaId: rutaId ?? this.rutaId,
    medidor: medidor ?? this.medidor,
    direccion: direccion ?? this.direccion,
    valorAnterior: valorAnterior ?? this.valorAnterior,
    valorActual: valorActual.present ? valorActual.value : this.valorActual,
    observacion: observacion ?? this.observacion,
  );
  Lectura copyWithCompanion(LecturasCompanion data) {
    return Lectura(
      id: data.id.present ? data.id.value : this.id,
      rutaId: data.rutaId.present ? data.rutaId.value : this.rutaId,
      medidor: data.medidor.present ? data.medidor.value : this.medidor,
      direccion: data.direccion.present ? data.direccion.value : this.direccion,
      valorAnterior: data.valorAnterior.present
          ? data.valorAnterior.value
          : this.valorAnterior,
      valorActual: data.valorActual.present
          ? data.valorActual.value
          : this.valorActual,
      observacion: data.observacion.present
          ? data.observacion.value
          : this.observacion,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Lectura(')
          ..write('id: $id, ')
          ..write('rutaId: $rutaId, ')
          ..write('medidor: $medidor, ')
          ..write('direccion: $direccion, ')
          ..write('valorAnterior: $valorAnterior, ')
          ..write('valorActual: $valorActual, ')
          ..write('observacion: $observacion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    rutaId,
    medidor,
    direccion,
    valorAnterior,
    valorActual,
    observacion,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Lectura &&
          other.id == this.id &&
          other.rutaId == this.rutaId &&
          other.medidor == this.medidor &&
          other.direccion == this.direccion &&
          other.valorAnterior == this.valorAnterior &&
          other.valorActual == this.valorActual &&
          other.observacion == this.observacion);
}

class LecturasCompanion extends UpdateCompanion<Lectura> {
  final Value<int> id;
  final Value<int> rutaId;
  final Value<String> medidor;
  final Value<String> direccion;
  final Value<double> valorAnterior;
  final Value<double?> valorActual;
  final Value<String> observacion;
  const LecturasCompanion({
    this.id = const Value.absent(),
    this.rutaId = const Value.absent(),
    this.medidor = const Value.absent(),
    this.direccion = const Value.absent(),
    this.valorAnterior = const Value.absent(),
    this.valorActual = const Value.absent(),
    this.observacion = const Value.absent(),
  });
  LecturasCompanion.insert({
    this.id = const Value.absent(),
    required int rutaId,
    required String medidor,
    required String direccion,
    required double valorAnterior,
    this.valorActual = const Value.absent(),
    this.observacion = const Value.absent(),
  }) : rutaId = Value(rutaId),
       medidor = Value(medidor),
       direccion = Value(direccion),
       valorAnterior = Value(valorAnterior);
  static Insertable<Lectura> custom({
    Expression<int>? id,
    Expression<int>? rutaId,
    Expression<String>? medidor,
    Expression<String>? direccion,
    Expression<double>? valorAnterior,
    Expression<double>? valorActual,
    Expression<String>? observacion,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (rutaId != null) 'ruta_id': rutaId,
      if (medidor != null) 'medidor': medidor,
      if (direccion != null) 'direccion': direccion,
      if (valorAnterior != null) 'valor_anterior': valorAnterior,
      if (valorActual != null) 'valor_actual': valorActual,
      if (observacion != null) 'observacion': observacion,
    });
  }

  LecturasCompanion copyWith({
    Value<int>? id,
    Value<int>? rutaId,
    Value<String>? medidor,
    Value<String>? direccion,
    Value<double>? valorAnterior,
    Value<double?>? valorActual,
    Value<String>? observacion,
  }) {
    return LecturasCompanion(
      id: id ?? this.id,
      rutaId: rutaId ?? this.rutaId,
      medidor: medidor ?? this.medidor,
      direccion: direccion ?? this.direccion,
      valorAnterior: valorAnterior ?? this.valorAnterior,
      valorActual: valorActual ?? this.valorActual,
      observacion: observacion ?? this.observacion,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (rutaId.present) {
      map['ruta_id'] = Variable<int>(rutaId.value);
    }
    if (medidor.present) {
      map['medidor'] = Variable<String>(medidor.value);
    }
    if (direccion.present) {
      map['direccion'] = Variable<String>(direccion.value);
    }
    if (valorAnterior.present) {
      map['valor_anterior'] = Variable<double>(valorAnterior.value);
    }
    if (valorActual.present) {
      map['valor_actual'] = Variable<double>(valorActual.value);
    }
    if (observacion.present) {
      map['observacion'] = Variable<String>(observacion.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LecturasCompanion(')
          ..write('id: $id, ')
          ..write('rutaId: $rutaId, ')
          ..write('medidor: $medidor, ')
          ..write('direccion: $direccion, ')
          ..write('valorAnterior: $valorAnterior, ')
          ..write('valorActual: $valorActual, ')
          ..write('observacion: $observacion')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $RutasTable rutas = $RutasTable(this);
  late final $LecturasTable lecturas = $LecturasTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [rutas, lecturas];
}

typedef $$RutasTableCreateCompanionBuilder =
    RutasCompanion Function({
      Value<int> id,
      required String nombre,
      Value<String?> valorGuardado,
    });
typedef $$RutasTableUpdateCompanionBuilder =
    RutasCompanion Function({
      Value<int> id,
      Value<String> nombre,
      Value<String?> valorGuardado,
    });

final class $$RutasTableReferences
    extends BaseReferences<_$AppDatabase, $RutasTable, Ruta> {
  $$RutasTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$LecturasTable, List<Lectura>> _lecturasRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.lecturas,
    aliasName: 'rutas__id__lecturas__ruta_id',
  );

  $$LecturasTableProcessedTableManager get lecturasRefs {
    final manager = $$LecturasTableTableManager(
      $_db,
      $_db.lecturas,
    ).filter((f) => f.rutaId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_lecturasRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RutasTableFilterComposer extends Composer<_$AppDatabase, $RutasTable> {
  $$RutasTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get valorGuardado => $composableBuilder(
    column: $table.valorGuardado,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> lecturasRefs(
    Expression<bool> Function($$LecturasTableFilterComposer f) f,
  ) {
    final $$LecturasTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.lecturas,
      getReferencedColumn: (t) => t.rutaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LecturasTableFilterComposer(
            $db: $db,
            $table: $db.lecturas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RutasTableOrderingComposer
    extends Composer<_$AppDatabase, $RutasTable> {
  $$RutasTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get valorGuardado => $composableBuilder(
    column: $table.valorGuardado,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RutasTableAnnotationComposer
    extends Composer<_$AppDatabase, $RutasTable> {
  $$RutasTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nombre =>
      $composableBuilder(column: $table.nombre, builder: (column) => column);

  GeneratedColumn<String> get valorGuardado => $composableBuilder(
    column: $table.valorGuardado,
    builder: (column) => column,
  );

  Expression<T> lecturasRefs<T extends Object>(
    Expression<T> Function($$LecturasTableAnnotationComposer a) f,
  ) {
    final $$LecturasTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.lecturas,
      getReferencedColumn: (t) => t.rutaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LecturasTableAnnotationComposer(
            $db: $db,
            $table: $db.lecturas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RutasTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RutasTable,
          Ruta,
          $$RutasTableFilterComposer,
          $$RutasTableOrderingComposer,
          $$RutasTableAnnotationComposer,
          $$RutasTableCreateCompanionBuilder,
          $$RutasTableUpdateCompanionBuilder,
          (Ruta, $$RutasTableReferences),
          Ruta,
          PrefetchHooks Function({bool lecturasRefs})
        > {
  $$RutasTableTableManager(_$AppDatabase db, $RutasTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RutasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RutasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RutasTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> nombre = const Value.absent(),
                Value<String?> valorGuardado = const Value.absent(),
              }) => RutasCompanion(
                id: id,
                nombre: nombre,
                valorGuardado: valorGuardado,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String nombre,
                Value<String?> valorGuardado = const Value.absent(),
              }) => RutasCompanion.insert(
                id: id,
                nombre: nombre,
                valorGuardado: valorGuardado,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$RutasTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({lecturasRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (lecturasRefs) db.lecturas],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (lecturasRefs)
                    await $_getPrefetchedData<Ruta, $RutasTable, Lectura>(
                      currentTable: table,
                      referencedTable: $$RutasTableReferences
                          ._lecturasRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$RutasTableReferences(db, table, p0).lecturasRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.rutaId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$RutasTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RutasTable,
      Ruta,
      $$RutasTableFilterComposer,
      $$RutasTableOrderingComposer,
      $$RutasTableAnnotationComposer,
      $$RutasTableCreateCompanionBuilder,
      $$RutasTableUpdateCompanionBuilder,
      (Ruta, $$RutasTableReferences),
      Ruta,
      PrefetchHooks Function({bool lecturasRefs})
    >;
typedef $$LecturasTableCreateCompanionBuilder =
    LecturasCompanion Function({
      Value<int> id,
      required int rutaId,
      required String medidor,
      required String direccion,
      required double valorAnterior,
      Value<double?> valorActual,
      Value<String> observacion,
    });
typedef $$LecturasTableUpdateCompanionBuilder =
    LecturasCompanion Function({
      Value<int> id,
      Value<int> rutaId,
      Value<String> medidor,
      Value<String> direccion,
      Value<double> valorAnterior,
      Value<double?> valorActual,
      Value<String> observacion,
    });

final class $$LecturasTableReferences
    extends BaseReferences<_$AppDatabase, $LecturasTable, Lectura> {
  $$LecturasTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $RutasTable _rutaIdTable(_$AppDatabase db) =>
      db.rutas.createAlias('lecturas__ruta_id__rutas__id');

  $$RutasTableProcessedTableManager get rutaId {
    final $_column = $_itemColumn<int>('ruta_id')!;

    final manager = $$RutasTableTableManager(
      $_db,
      $_db.rutas,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_rutaIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$LecturasTableFilterComposer
    extends Composer<_$AppDatabase, $LecturasTable> {
  $$LecturasTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get medidor => $composableBuilder(
    column: $table.medidor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get direccion => $composableBuilder(
    column: $table.direccion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get valorAnterior => $composableBuilder(
    column: $table.valorAnterior,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get valorActual => $composableBuilder(
    column: $table.valorActual,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get observacion => $composableBuilder(
    column: $table.observacion,
    builder: (column) => ColumnFilters(column),
  );

  $$RutasTableFilterComposer get rutaId {
    final $$RutasTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.rutaId,
      referencedTable: $db.rutas,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RutasTableFilterComposer(
            $db: $db,
            $table: $db.rutas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LecturasTableOrderingComposer
    extends Composer<_$AppDatabase, $LecturasTable> {
  $$LecturasTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get medidor => $composableBuilder(
    column: $table.medidor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get direccion => $composableBuilder(
    column: $table.direccion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get valorAnterior => $composableBuilder(
    column: $table.valorAnterior,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get valorActual => $composableBuilder(
    column: $table.valorActual,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get observacion => $composableBuilder(
    column: $table.observacion,
    builder: (column) => ColumnOrderings(column),
  );

  $$RutasTableOrderingComposer get rutaId {
    final $$RutasTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.rutaId,
      referencedTable: $db.rutas,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RutasTableOrderingComposer(
            $db: $db,
            $table: $db.rutas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LecturasTableAnnotationComposer
    extends Composer<_$AppDatabase, $LecturasTable> {
  $$LecturasTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get medidor =>
      $composableBuilder(column: $table.medidor, builder: (column) => column);

  GeneratedColumn<String> get direccion =>
      $composableBuilder(column: $table.direccion, builder: (column) => column);

  GeneratedColumn<double> get valorAnterior => $composableBuilder(
    column: $table.valorAnterior,
    builder: (column) => column,
  );

  GeneratedColumn<double> get valorActual => $composableBuilder(
    column: $table.valorActual,
    builder: (column) => column,
  );

  GeneratedColumn<String> get observacion => $composableBuilder(
    column: $table.observacion,
    builder: (column) => column,
  );

  $$RutasTableAnnotationComposer get rutaId {
    final $$RutasTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.rutaId,
      referencedTable: $db.rutas,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RutasTableAnnotationComposer(
            $db: $db,
            $table: $db.rutas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LecturasTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LecturasTable,
          Lectura,
          $$LecturasTableFilterComposer,
          $$LecturasTableOrderingComposer,
          $$LecturasTableAnnotationComposer,
          $$LecturasTableCreateCompanionBuilder,
          $$LecturasTableUpdateCompanionBuilder,
          (Lectura, $$LecturasTableReferences),
          Lectura,
          PrefetchHooks Function({bool rutaId})
        > {
  $$LecturasTableTableManager(_$AppDatabase db, $LecturasTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LecturasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LecturasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LecturasTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> rutaId = const Value.absent(),
                Value<String> medidor = const Value.absent(),
                Value<String> direccion = const Value.absent(),
                Value<double> valorAnterior = const Value.absent(),
                Value<double?> valorActual = const Value.absent(),
                Value<String> observacion = const Value.absent(),
              }) => LecturasCompanion(
                id: id,
                rutaId: rutaId,
                medidor: medidor,
                direccion: direccion,
                valorAnterior: valorAnterior,
                valorActual: valorActual,
                observacion: observacion,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int rutaId,
                required String medidor,
                required String direccion,
                required double valorAnterior,
                Value<double?> valorActual = const Value.absent(),
                Value<String> observacion = const Value.absent(),
              }) => LecturasCompanion.insert(
                id: id,
                rutaId: rutaId,
                medidor: medidor,
                direccion: direccion,
                valorAnterior: valorAnterior,
                valorActual: valorActual,
                observacion: observacion,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$LecturasTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({rutaId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (rutaId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.rutaId,
                                referencedTable: $$LecturasTableReferences
                                    ._rutaIdTable(db),
                                referencedColumn: $$LecturasTableReferences
                                    ._rutaIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$LecturasTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LecturasTable,
      Lectura,
      $$LecturasTableFilterComposer,
      $$LecturasTableOrderingComposer,
      $$LecturasTableAnnotationComposer,
      $$LecturasTableCreateCompanionBuilder,
      $$LecturasTableUpdateCompanionBuilder,
      (Lectura, $$LecturasTableReferences),
      Lectura,
      PrefetchHooks Function({bool rutaId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$RutasTableTableManager get rutas =>
      $$RutasTableTableManager(_db, _db.rutas);
  $$LecturasTableTableManager get lecturas =>
      $$LecturasTableTableManager(_db, _db.lecturas);
}
