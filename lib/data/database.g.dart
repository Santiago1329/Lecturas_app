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
  static const VerificationMeta _estadoMeta = const VerificationMeta('estado');
  @override
  late final GeneratedColumn<String> estado = GeneratedColumn<String>(
    'estado',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pendiente'),
  );
  static const VerificationMeta _remoteIdMeta = const VerificationMeta(
    'remoteId',
  );
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
    'remote_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _opcionesNlLcMeta = const VerificationMeta(
    'opcionesNlLc',
  );
  @override
  late final GeneratedColumn<String> opcionesNlLc = GeneratedColumn<String>(
    'opciones_nl_lc',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    nombre,
    estado,
    remoteId,
    opcionesNlLc,
  ];
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
    if (data.containsKey('estado')) {
      context.handle(
        _estadoMeta,
        estado.isAcceptableOrUnknown(data['estado']!, _estadoMeta),
      );
    }
    if (data.containsKey('remote_id')) {
      context.handle(
        _remoteIdMeta,
        remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta),
      );
    }
    if (data.containsKey('opciones_nl_lc')) {
      context.handle(
        _opcionesNlLcMeta,
        opcionesNlLc.isAcceptableOrUnknown(
          data['opciones_nl_lc']!,
          _opcionesNlLcMeta,
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
      estado: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}estado'],
      )!,
      remoteId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remote_id'],
      ),
      opcionesNlLc: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}opciones_nl_lc'],
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
  final String estado;
  final String? remoteId;
  final String? opcionesNlLc;
  const Ruta({
    required this.id,
    required this.nombre,
    required this.estado,
    this.remoteId,
    this.opcionesNlLc,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nombre'] = Variable<String>(nombre);
    map['estado'] = Variable<String>(estado);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String>(remoteId);
    }
    if (!nullToAbsent || opcionesNlLc != null) {
      map['opciones_nl_lc'] = Variable<String>(opcionesNlLc);
    }
    return map;
  }

  RutasCompanion toCompanion(bool nullToAbsent) {
    return RutasCompanion(
      id: Value(id),
      nombre: Value(nombre),
      estado: Value(estado),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      opcionesNlLc: opcionesNlLc == null && nullToAbsent
          ? const Value.absent()
          : Value(opcionesNlLc),
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
      estado: serializer.fromJson<String>(json['estado']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
      opcionesNlLc: serializer.fromJson<String?>(json['opcionesNlLc']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nombre': serializer.toJson<String>(nombre),
      'estado': serializer.toJson<String>(estado),
      'remoteId': serializer.toJson<String?>(remoteId),
      'opcionesNlLc': serializer.toJson<String?>(opcionesNlLc),
    };
  }

  Ruta copyWith({
    int? id,
    String? nombre,
    String? estado,
    Value<String?> remoteId = const Value.absent(),
    Value<String?> opcionesNlLc = const Value.absent(),
  }) => Ruta(
    id: id ?? this.id,
    nombre: nombre ?? this.nombre,
    estado: estado ?? this.estado,
    remoteId: remoteId.present ? remoteId.value : this.remoteId,
    opcionesNlLc: opcionesNlLc.present ? opcionesNlLc.value : this.opcionesNlLc,
  );
  Ruta copyWithCompanion(RutasCompanion data) {
    return Ruta(
      id: data.id.present ? data.id.value : this.id,
      nombre: data.nombre.present ? data.nombre.value : this.nombre,
      estado: data.estado.present ? data.estado.value : this.estado,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      opcionesNlLc: data.opcionesNlLc.present
          ? data.opcionesNlLc.value
          : this.opcionesNlLc,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Ruta(')
          ..write('id: $id, ')
          ..write('nombre: $nombre, ')
          ..write('estado: $estado, ')
          ..write('remoteId: $remoteId, ')
          ..write('opcionesNlLc: $opcionesNlLc')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nombre, estado, remoteId, opcionesNlLc);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Ruta &&
          other.id == this.id &&
          other.nombre == this.nombre &&
          other.estado == this.estado &&
          other.remoteId == this.remoteId &&
          other.opcionesNlLc == this.opcionesNlLc);
}

class RutasCompanion extends UpdateCompanion<Ruta> {
  final Value<int> id;
  final Value<String> nombre;
  final Value<String> estado;
  final Value<String?> remoteId;
  final Value<String?> opcionesNlLc;
  const RutasCompanion({
    this.id = const Value.absent(),
    this.nombre = const Value.absent(),
    this.estado = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.opcionesNlLc = const Value.absent(),
  });
  RutasCompanion.insert({
    this.id = const Value.absent(),
    required String nombre,
    this.estado = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.opcionesNlLc = const Value.absent(),
  }) : nombre = Value(nombre);
  static Insertable<Ruta> custom({
    Expression<int>? id,
    Expression<String>? nombre,
    Expression<String>? estado,
    Expression<String>? remoteId,
    Expression<String>? opcionesNlLc,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nombre != null) 'nombre': nombre,
      if (estado != null) 'estado': estado,
      if (remoteId != null) 'remote_id': remoteId,
      if (opcionesNlLc != null) 'opciones_nl_lc': opcionesNlLc,
    });
  }

  RutasCompanion copyWith({
    Value<int>? id,
    Value<String>? nombre,
    Value<String>? estado,
    Value<String?>? remoteId,
    Value<String?>? opcionesNlLc,
  }) {
    return RutasCompanion(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      estado: estado ?? this.estado,
      remoteId: remoteId ?? this.remoteId,
      opcionesNlLc: opcionesNlLc ?? this.opcionesNlLc,
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
    if (estado.present) {
      map['estado'] = Variable<String>(estado.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (opcionesNlLc.present) {
      map['opciones_nl_lc'] = Variable<String>(opcionesNlLc.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RutasCompanion(')
          ..write('id: $id, ')
          ..write('nombre: $nombre, ')
          ..write('estado: $estado, ')
          ..write('remoteId: $remoteId, ')
          ..write('opcionesNlLc: $opcionesNlLc')
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
  static const VerificationMeta _codigoMeta = const VerificationMeta('codigo');
  @override
  late final GeneratedColumn<String> codigo = GeneratedColumn<String>(
    'codigo',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nombreClienteMeta = const VerificationMeta(
    'nombreCliente',
  );
  @override
  late final GeneratedColumn<String> nombreCliente = GeneratedColumn<String>(
    'nombre_cliente',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _direccionMeta = const VerificationMeta(
    'direccion',
  );
  @override
  late final GeneratedColumn<String> direccion = GeneratedColumn<String>(
    'direccion',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lectAntMeta = const VerificationMeta(
    'lectAnt',
  );
  @override
  late final GeneratedColumn<double> lectAnt = GeneratedColumn<double>(
    'lect_ant',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _consAntMeta = const VerificationMeta(
    'consAnt',
  );
  @override
  late final GeneratedColumn<double> consAnt = GeneratedColumn<double>(
    'cons_ant',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lectActMeta = const VerificationMeta(
    'lectAct',
  );
  @override
  late final GeneratedColumn<double> lectAct = GeneratedColumn<double>(
    'lect_act',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _consActMeta = const VerificationMeta(
    'consAct',
  );
  @override
  late final GeneratedColumn<double> consAct = GeneratedColumn<double>(
    'cons_act',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descripcionMeta = const VerificationMeta(
    'descripcion',
  );
  @override
  late final GeneratedColumn<String> descripcion = GeneratedColumn<String>(
    'descripcion',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _promedioMeta = const VerificationMeta(
    'promedio',
  );
  @override
  late final GeneratedColumn<double> promedio = GeneratedColumn<double>(
    'promedio',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _serieMeta = const VerificationMeta('serie');
  @override
  late final GeneratedColumn<String> serie = GeneratedColumn<String>(
    'serie',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lectRevMeta = const VerificationMeta(
    'lectRev',
  );
  @override
  late final GeneratedColumn<double> lectRev = GeneratedColumn<double>(
    'lect_rev',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nlLcMeta = const VerificationMeta('nlLc');
  @override
  late final GeneratedColumn<String> nlLc = GeneratedColumn<String>(
    'nl_lc',
    aliasedName,
    true,
    type: DriftSqlType.string,
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
  static const VerificationMeta _sincronizadaMeta = const VerificationMeta(
    'sincronizada',
  );
  @override
  late final GeneratedColumn<bool> sincronizada = GeneratedColumn<bool>(
    'sincronizada',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("sincronizada" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _remoteIdMeta = const VerificationMeta(
    'remoteId',
  );
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
    'remote_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    rutaId,
    codigo,
    nombreCliente,
    direccion,
    lectAnt,
    consAnt,
    lectAct,
    consAct,
    descripcion,
    promedio,
    serie,
    lectRev,
    nlLc,
    observacion,
    sincronizada,
    remoteId,
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
    if (data.containsKey('codigo')) {
      context.handle(
        _codigoMeta,
        codigo.isAcceptableOrUnknown(data['codigo']!, _codigoMeta),
      );
    } else if (isInserting) {
      context.missing(_codigoMeta);
    }
    if (data.containsKey('nombre_cliente')) {
      context.handle(
        _nombreClienteMeta,
        nombreCliente.isAcceptableOrUnknown(
          data['nombre_cliente']!,
          _nombreClienteMeta,
        ),
      );
    }
    if (data.containsKey('direccion')) {
      context.handle(
        _direccionMeta,
        direccion.isAcceptableOrUnknown(data['direccion']!, _direccionMeta),
      );
    }
    if (data.containsKey('lect_ant')) {
      context.handle(
        _lectAntMeta,
        lectAnt.isAcceptableOrUnknown(data['lect_ant']!, _lectAntMeta),
      );
    }
    if (data.containsKey('cons_ant')) {
      context.handle(
        _consAntMeta,
        consAnt.isAcceptableOrUnknown(data['cons_ant']!, _consAntMeta),
      );
    }
    if (data.containsKey('lect_act')) {
      context.handle(
        _lectActMeta,
        lectAct.isAcceptableOrUnknown(data['lect_act']!, _lectActMeta),
      );
    }
    if (data.containsKey('cons_act')) {
      context.handle(
        _consActMeta,
        consAct.isAcceptableOrUnknown(data['cons_act']!, _consActMeta),
      );
    }
    if (data.containsKey('descripcion')) {
      context.handle(
        _descripcionMeta,
        descripcion.isAcceptableOrUnknown(
          data['descripcion']!,
          _descripcionMeta,
        ),
      );
    }
    if (data.containsKey('promedio')) {
      context.handle(
        _promedioMeta,
        promedio.isAcceptableOrUnknown(data['promedio']!, _promedioMeta),
      );
    }
    if (data.containsKey('serie')) {
      context.handle(
        _serieMeta,
        serie.isAcceptableOrUnknown(data['serie']!, _serieMeta),
      );
    }
    if (data.containsKey('lect_rev')) {
      context.handle(
        _lectRevMeta,
        lectRev.isAcceptableOrUnknown(data['lect_rev']!, _lectRevMeta),
      );
    }
    if (data.containsKey('nl_lc')) {
      context.handle(
        _nlLcMeta,
        nlLc.isAcceptableOrUnknown(data['nl_lc']!, _nlLcMeta),
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
    if (data.containsKey('sincronizada')) {
      context.handle(
        _sincronizadaMeta,
        sincronizada.isAcceptableOrUnknown(
          data['sincronizada']!,
          _sincronizadaMeta,
        ),
      );
    }
    if (data.containsKey('remote_id')) {
      context.handle(
        _remoteIdMeta,
        remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta),
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
      codigo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}codigo'],
      )!,
      nombreCliente: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nombre_cliente'],
      ),
      direccion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}direccion'],
      ),
      lectAnt: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lect_ant'],
      ),
      consAnt: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}cons_ant'],
      ),
      lectAct: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lect_act'],
      ),
      consAct: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}cons_act'],
      ),
      descripcion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}descripcion'],
      ),
      promedio: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}promedio'],
      ),
      serie: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}serie'],
      ),
      lectRev: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lect_rev'],
      ),
      nlLc: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nl_lc'],
      ),
      observacion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}observacion'],
      )!,
      sincronizada: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}sincronizada'],
      )!,
      remoteId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remote_id'],
      ),
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
  final String codigo;
  final String? nombreCliente;
  final String? direccion;
  final double? lectAnt;
  final double? consAnt;
  final double? lectAct;
  final double? consAct;
  final String? descripcion;
  final double? promedio;
  final String? serie;
  final double? lectRev;
  final String? nlLc;
  final String observacion;
  final bool sincronizada;
  final String? remoteId;
  const Lectura({
    required this.id,
    required this.rutaId,
    required this.codigo,
    this.nombreCliente,
    this.direccion,
    this.lectAnt,
    this.consAnt,
    this.lectAct,
    this.consAct,
    this.descripcion,
    this.promedio,
    this.serie,
    this.lectRev,
    this.nlLc,
    required this.observacion,
    required this.sincronizada,
    this.remoteId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['ruta_id'] = Variable<int>(rutaId);
    map['codigo'] = Variable<String>(codigo);
    if (!nullToAbsent || nombreCliente != null) {
      map['nombre_cliente'] = Variable<String>(nombreCliente);
    }
    if (!nullToAbsent || direccion != null) {
      map['direccion'] = Variable<String>(direccion);
    }
    if (!nullToAbsent || lectAnt != null) {
      map['lect_ant'] = Variable<double>(lectAnt);
    }
    if (!nullToAbsent || consAnt != null) {
      map['cons_ant'] = Variable<double>(consAnt);
    }
    if (!nullToAbsent || lectAct != null) {
      map['lect_act'] = Variable<double>(lectAct);
    }
    if (!nullToAbsent || consAct != null) {
      map['cons_act'] = Variable<double>(consAct);
    }
    if (!nullToAbsent || descripcion != null) {
      map['descripcion'] = Variable<String>(descripcion);
    }
    if (!nullToAbsent || promedio != null) {
      map['promedio'] = Variable<double>(promedio);
    }
    if (!nullToAbsent || serie != null) {
      map['serie'] = Variable<String>(serie);
    }
    if (!nullToAbsent || lectRev != null) {
      map['lect_rev'] = Variable<double>(lectRev);
    }
    if (!nullToAbsent || nlLc != null) {
      map['nl_lc'] = Variable<String>(nlLc);
    }
    map['observacion'] = Variable<String>(observacion);
    map['sincronizada'] = Variable<bool>(sincronizada);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String>(remoteId);
    }
    return map;
  }

  LecturasCompanion toCompanion(bool nullToAbsent) {
    return LecturasCompanion(
      id: Value(id),
      rutaId: Value(rutaId),
      codigo: Value(codigo),
      nombreCliente: nombreCliente == null && nullToAbsent
          ? const Value.absent()
          : Value(nombreCliente),
      direccion: direccion == null && nullToAbsent
          ? const Value.absent()
          : Value(direccion),
      lectAnt: lectAnt == null && nullToAbsent
          ? const Value.absent()
          : Value(lectAnt),
      consAnt: consAnt == null && nullToAbsent
          ? const Value.absent()
          : Value(consAnt),
      lectAct: lectAct == null && nullToAbsent
          ? const Value.absent()
          : Value(lectAct),
      consAct: consAct == null && nullToAbsent
          ? const Value.absent()
          : Value(consAct),
      descripcion: descripcion == null && nullToAbsent
          ? const Value.absent()
          : Value(descripcion),
      promedio: promedio == null && nullToAbsent
          ? const Value.absent()
          : Value(promedio),
      serie: serie == null && nullToAbsent
          ? const Value.absent()
          : Value(serie),
      lectRev: lectRev == null && nullToAbsent
          ? const Value.absent()
          : Value(lectRev),
      nlLc: nlLc == null && nullToAbsent ? const Value.absent() : Value(nlLc),
      observacion: Value(observacion),
      sincronizada: Value(sincronizada),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
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
      codigo: serializer.fromJson<String>(json['codigo']),
      nombreCliente: serializer.fromJson<String?>(json['nombreCliente']),
      direccion: serializer.fromJson<String?>(json['direccion']),
      lectAnt: serializer.fromJson<double?>(json['lectAnt']),
      consAnt: serializer.fromJson<double?>(json['consAnt']),
      lectAct: serializer.fromJson<double?>(json['lectAct']),
      consAct: serializer.fromJson<double?>(json['consAct']),
      descripcion: serializer.fromJson<String?>(json['descripcion']),
      promedio: serializer.fromJson<double?>(json['promedio']),
      serie: serializer.fromJson<String?>(json['serie']),
      lectRev: serializer.fromJson<double?>(json['lectRev']),
      nlLc: serializer.fromJson<String?>(json['nlLc']),
      observacion: serializer.fromJson<String>(json['observacion']),
      sincronizada: serializer.fromJson<bool>(json['sincronizada']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'rutaId': serializer.toJson<int>(rutaId),
      'codigo': serializer.toJson<String>(codigo),
      'nombreCliente': serializer.toJson<String?>(nombreCliente),
      'direccion': serializer.toJson<String?>(direccion),
      'lectAnt': serializer.toJson<double?>(lectAnt),
      'consAnt': serializer.toJson<double?>(consAnt),
      'lectAct': serializer.toJson<double?>(lectAct),
      'consAct': serializer.toJson<double?>(consAct),
      'descripcion': serializer.toJson<String?>(descripcion),
      'promedio': serializer.toJson<double?>(promedio),
      'serie': serializer.toJson<String?>(serie),
      'lectRev': serializer.toJson<double?>(lectRev),
      'nlLc': serializer.toJson<String?>(nlLc),
      'observacion': serializer.toJson<String>(observacion),
      'sincronizada': serializer.toJson<bool>(sincronizada),
      'remoteId': serializer.toJson<String?>(remoteId),
    };
  }

  Lectura copyWith({
    int? id,
    int? rutaId,
    String? codigo,
    Value<String?> nombreCliente = const Value.absent(),
    Value<String?> direccion = const Value.absent(),
    Value<double?> lectAnt = const Value.absent(),
    Value<double?> consAnt = const Value.absent(),
    Value<double?> lectAct = const Value.absent(),
    Value<double?> consAct = const Value.absent(),
    Value<String?> descripcion = const Value.absent(),
    Value<double?> promedio = const Value.absent(),
    Value<String?> serie = const Value.absent(),
    Value<double?> lectRev = const Value.absent(),
    Value<String?> nlLc = const Value.absent(),
    String? observacion,
    bool? sincronizada,
    Value<String?> remoteId = const Value.absent(),
  }) => Lectura(
    id: id ?? this.id,
    rutaId: rutaId ?? this.rutaId,
    codigo: codigo ?? this.codigo,
    nombreCliente: nombreCliente.present
        ? nombreCliente.value
        : this.nombreCliente,
    direccion: direccion.present ? direccion.value : this.direccion,
    lectAnt: lectAnt.present ? lectAnt.value : this.lectAnt,
    consAnt: consAnt.present ? consAnt.value : this.consAnt,
    lectAct: lectAct.present ? lectAct.value : this.lectAct,
    consAct: consAct.present ? consAct.value : this.consAct,
    descripcion: descripcion.present ? descripcion.value : this.descripcion,
    promedio: promedio.present ? promedio.value : this.promedio,
    serie: serie.present ? serie.value : this.serie,
    lectRev: lectRev.present ? lectRev.value : this.lectRev,
    nlLc: nlLc.present ? nlLc.value : this.nlLc,
    observacion: observacion ?? this.observacion,
    sincronizada: sincronizada ?? this.sincronizada,
    remoteId: remoteId.present ? remoteId.value : this.remoteId,
  );
  Lectura copyWithCompanion(LecturasCompanion data) {
    return Lectura(
      id: data.id.present ? data.id.value : this.id,
      rutaId: data.rutaId.present ? data.rutaId.value : this.rutaId,
      codigo: data.codigo.present ? data.codigo.value : this.codigo,
      nombreCliente: data.nombreCliente.present
          ? data.nombreCliente.value
          : this.nombreCliente,
      direccion: data.direccion.present ? data.direccion.value : this.direccion,
      lectAnt: data.lectAnt.present ? data.lectAnt.value : this.lectAnt,
      consAnt: data.consAnt.present ? data.consAnt.value : this.consAnt,
      lectAct: data.lectAct.present ? data.lectAct.value : this.lectAct,
      consAct: data.consAct.present ? data.consAct.value : this.consAct,
      descripcion: data.descripcion.present
          ? data.descripcion.value
          : this.descripcion,
      promedio: data.promedio.present ? data.promedio.value : this.promedio,
      serie: data.serie.present ? data.serie.value : this.serie,
      lectRev: data.lectRev.present ? data.lectRev.value : this.lectRev,
      nlLc: data.nlLc.present ? data.nlLc.value : this.nlLc,
      observacion: data.observacion.present
          ? data.observacion.value
          : this.observacion,
      sincronizada: data.sincronizada.present
          ? data.sincronizada.value
          : this.sincronizada,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Lectura(')
          ..write('id: $id, ')
          ..write('rutaId: $rutaId, ')
          ..write('codigo: $codigo, ')
          ..write('nombreCliente: $nombreCliente, ')
          ..write('direccion: $direccion, ')
          ..write('lectAnt: $lectAnt, ')
          ..write('consAnt: $consAnt, ')
          ..write('lectAct: $lectAct, ')
          ..write('consAct: $consAct, ')
          ..write('descripcion: $descripcion, ')
          ..write('promedio: $promedio, ')
          ..write('serie: $serie, ')
          ..write('lectRev: $lectRev, ')
          ..write('nlLc: $nlLc, ')
          ..write('observacion: $observacion, ')
          ..write('sincronizada: $sincronizada, ')
          ..write('remoteId: $remoteId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    rutaId,
    codigo,
    nombreCliente,
    direccion,
    lectAnt,
    consAnt,
    lectAct,
    consAct,
    descripcion,
    promedio,
    serie,
    lectRev,
    nlLc,
    observacion,
    sincronizada,
    remoteId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Lectura &&
          other.id == this.id &&
          other.rutaId == this.rutaId &&
          other.codigo == this.codigo &&
          other.nombreCliente == this.nombreCliente &&
          other.direccion == this.direccion &&
          other.lectAnt == this.lectAnt &&
          other.consAnt == this.consAnt &&
          other.lectAct == this.lectAct &&
          other.consAct == this.consAct &&
          other.descripcion == this.descripcion &&
          other.promedio == this.promedio &&
          other.serie == this.serie &&
          other.lectRev == this.lectRev &&
          other.nlLc == this.nlLc &&
          other.observacion == this.observacion &&
          other.sincronizada == this.sincronizada &&
          other.remoteId == this.remoteId);
}

class LecturasCompanion extends UpdateCompanion<Lectura> {
  final Value<int> id;
  final Value<int> rutaId;
  final Value<String> codigo;
  final Value<String?> nombreCliente;
  final Value<String?> direccion;
  final Value<double?> lectAnt;
  final Value<double?> consAnt;
  final Value<double?> lectAct;
  final Value<double?> consAct;
  final Value<String?> descripcion;
  final Value<double?> promedio;
  final Value<String?> serie;
  final Value<double?> lectRev;
  final Value<String?> nlLc;
  final Value<String> observacion;
  final Value<bool> sincronizada;
  final Value<String?> remoteId;
  const LecturasCompanion({
    this.id = const Value.absent(),
    this.rutaId = const Value.absent(),
    this.codigo = const Value.absent(),
    this.nombreCliente = const Value.absent(),
    this.direccion = const Value.absent(),
    this.lectAnt = const Value.absent(),
    this.consAnt = const Value.absent(),
    this.lectAct = const Value.absent(),
    this.consAct = const Value.absent(),
    this.descripcion = const Value.absent(),
    this.promedio = const Value.absent(),
    this.serie = const Value.absent(),
    this.lectRev = const Value.absent(),
    this.nlLc = const Value.absent(),
    this.observacion = const Value.absent(),
    this.sincronizada = const Value.absent(),
    this.remoteId = const Value.absent(),
  });
  LecturasCompanion.insert({
    this.id = const Value.absent(),
    required int rutaId,
    required String codigo,
    this.nombreCliente = const Value.absent(),
    this.direccion = const Value.absent(),
    this.lectAnt = const Value.absent(),
    this.consAnt = const Value.absent(),
    this.lectAct = const Value.absent(),
    this.consAct = const Value.absent(),
    this.descripcion = const Value.absent(),
    this.promedio = const Value.absent(),
    this.serie = const Value.absent(),
    this.lectRev = const Value.absent(),
    this.nlLc = const Value.absent(),
    this.observacion = const Value.absent(),
    this.sincronizada = const Value.absent(),
    this.remoteId = const Value.absent(),
  }) : rutaId = Value(rutaId),
       codigo = Value(codigo);
  static Insertable<Lectura> custom({
    Expression<int>? id,
    Expression<int>? rutaId,
    Expression<String>? codigo,
    Expression<String>? nombreCliente,
    Expression<String>? direccion,
    Expression<double>? lectAnt,
    Expression<double>? consAnt,
    Expression<double>? lectAct,
    Expression<double>? consAct,
    Expression<String>? descripcion,
    Expression<double>? promedio,
    Expression<String>? serie,
    Expression<double>? lectRev,
    Expression<String>? nlLc,
    Expression<String>? observacion,
    Expression<bool>? sincronizada,
    Expression<String>? remoteId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (rutaId != null) 'ruta_id': rutaId,
      if (codigo != null) 'codigo': codigo,
      if (nombreCliente != null) 'nombre_cliente': nombreCliente,
      if (direccion != null) 'direccion': direccion,
      if (lectAnt != null) 'lect_ant': lectAnt,
      if (consAnt != null) 'cons_ant': consAnt,
      if (lectAct != null) 'lect_act': lectAct,
      if (consAct != null) 'cons_act': consAct,
      if (descripcion != null) 'descripcion': descripcion,
      if (promedio != null) 'promedio': promedio,
      if (serie != null) 'serie': serie,
      if (lectRev != null) 'lect_rev': lectRev,
      if (nlLc != null) 'nl_lc': nlLc,
      if (observacion != null) 'observacion': observacion,
      if (sincronizada != null) 'sincronizada': sincronizada,
      if (remoteId != null) 'remote_id': remoteId,
    });
  }

  LecturasCompanion copyWith({
    Value<int>? id,
    Value<int>? rutaId,
    Value<String>? codigo,
    Value<String?>? nombreCliente,
    Value<String?>? direccion,
    Value<double?>? lectAnt,
    Value<double?>? consAnt,
    Value<double?>? lectAct,
    Value<double?>? consAct,
    Value<String?>? descripcion,
    Value<double?>? promedio,
    Value<String?>? serie,
    Value<double?>? lectRev,
    Value<String?>? nlLc,
    Value<String>? observacion,
    Value<bool>? sincronizada,
    Value<String?>? remoteId,
  }) {
    return LecturasCompanion(
      id: id ?? this.id,
      rutaId: rutaId ?? this.rutaId,
      codigo: codigo ?? this.codigo,
      nombreCliente: nombreCliente ?? this.nombreCliente,
      direccion: direccion ?? this.direccion,
      lectAnt: lectAnt ?? this.lectAnt,
      consAnt: consAnt ?? this.consAnt,
      lectAct: lectAct ?? this.lectAct,
      consAct: consAct ?? this.consAct,
      descripcion: descripcion ?? this.descripcion,
      promedio: promedio ?? this.promedio,
      serie: serie ?? this.serie,
      lectRev: lectRev ?? this.lectRev,
      nlLc: nlLc ?? this.nlLc,
      observacion: observacion ?? this.observacion,
      sincronizada: sincronizada ?? this.sincronizada,
      remoteId: remoteId ?? this.remoteId,
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
    if (codigo.present) {
      map['codigo'] = Variable<String>(codigo.value);
    }
    if (nombreCliente.present) {
      map['nombre_cliente'] = Variable<String>(nombreCliente.value);
    }
    if (direccion.present) {
      map['direccion'] = Variable<String>(direccion.value);
    }
    if (lectAnt.present) {
      map['lect_ant'] = Variable<double>(lectAnt.value);
    }
    if (consAnt.present) {
      map['cons_ant'] = Variable<double>(consAnt.value);
    }
    if (lectAct.present) {
      map['lect_act'] = Variable<double>(lectAct.value);
    }
    if (consAct.present) {
      map['cons_act'] = Variable<double>(consAct.value);
    }
    if (descripcion.present) {
      map['descripcion'] = Variable<String>(descripcion.value);
    }
    if (promedio.present) {
      map['promedio'] = Variable<double>(promedio.value);
    }
    if (serie.present) {
      map['serie'] = Variable<String>(serie.value);
    }
    if (lectRev.present) {
      map['lect_rev'] = Variable<double>(lectRev.value);
    }
    if (nlLc.present) {
      map['nl_lc'] = Variable<String>(nlLc.value);
    }
    if (observacion.present) {
      map['observacion'] = Variable<String>(observacion.value);
    }
    if (sincronizada.present) {
      map['sincronizada'] = Variable<bool>(sincronizada.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LecturasCompanion(')
          ..write('id: $id, ')
          ..write('rutaId: $rutaId, ')
          ..write('codigo: $codigo, ')
          ..write('nombreCliente: $nombreCliente, ')
          ..write('direccion: $direccion, ')
          ..write('lectAnt: $lectAnt, ')
          ..write('consAnt: $consAnt, ')
          ..write('lectAct: $lectAct, ')
          ..write('consAct: $consAct, ')
          ..write('descripcion: $descripcion, ')
          ..write('promedio: $promedio, ')
          ..write('serie: $serie, ')
          ..write('lectRev: $lectRev, ')
          ..write('nlLc: $nlLc, ')
          ..write('observacion: $observacion, ')
          ..write('sincronizada: $sincronizada, ')
          ..write('remoteId: $remoteId')
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
      Value<String> estado,
      Value<String?> remoteId,
      Value<String?> opcionesNlLc,
    });
typedef $$RutasTableUpdateCompanionBuilder =
    RutasCompanion Function({
      Value<int> id,
      Value<String> nombre,
      Value<String> estado,
      Value<String?> remoteId,
      Value<String?> opcionesNlLc,
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

  ColumnFilters<String> get estado => $composableBuilder(
    column: $table.estado,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get opcionesNlLc => $composableBuilder(
    column: $table.opcionesNlLc,
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

  ColumnOrderings<String> get estado => $composableBuilder(
    column: $table.estado,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get opcionesNlLc => $composableBuilder(
    column: $table.opcionesNlLc,
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

  GeneratedColumn<String> get estado =>
      $composableBuilder(column: $table.estado, builder: (column) => column);

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<String> get opcionesNlLc => $composableBuilder(
    column: $table.opcionesNlLc,
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
                Value<String> estado = const Value.absent(),
                Value<String?> remoteId = const Value.absent(),
                Value<String?> opcionesNlLc = const Value.absent(),
              }) => RutasCompanion(
                id: id,
                nombre: nombre,
                estado: estado,
                remoteId: remoteId,
                opcionesNlLc: opcionesNlLc,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String nombre,
                Value<String> estado = const Value.absent(),
                Value<String?> remoteId = const Value.absent(),
                Value<String?> opcionesNlLc = const Value.absent(),
              }) => RutasCompanion.insert(
                id: id,
                nombre: nombre,
                estado: estado,
                remoteId: remoteId,
                opcionesNlLc: opcionesNlLc,
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
      required String codigo,
      Value<String?> nombreCliente,
      Value<String?> direccion,
      Value<double?> lectAnt,
      Value<double?> consAnt,
      Value<double?> lectAct,
      Value<double?> consAct,
      Value<String?> descripcion,
      Value<double?> promedio,
      Value<String?> serie,
      Value<double?> lectRev,
      Value<String?> nlLc,
      Value<String> observacion,
      Value<bool> sincronizada,
      Value<String?> remoteId,
    });
typedef $$LecturasTableUpdateCompanionBuilder =
    LecturasCompanion Function({
      Value<int> id,
      Value<int> rutaId,
      Value<String> codigo,
      Value<String?> nombreCliente,
      Value<String?> direccion,
      Value<double?> lectAnt,
      Value<double?> consAnt,
      Value<double?> lectAct,
      Value<double?> consAct,
      Value<String?> descripcion,
      Value<double?> promedio,
      Value<String?> serie,
      Value<double?> lectRev,
      Value<String?> nlLc,
      Value<String> observacion,
      Value<bool> sincronizada,
      Value<String?> remoteId,
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

  ColumnFilters<String> get codigo => $composableBuilder(
    column: $table.codigo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nombreCliente => $composableBuilder(
    column: $table.nombreCliente,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get direccion => $composableBuilder(
    column: $table.direccion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lectAnt => $composableBuilder(
    column: $table.lectAnt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get consAnt => $composableBuilder(
    column: $table.consAnt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lectAct => $composableBuilder(
    column: $table.lectAct,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get consAct => $composableBuilder(
    column: $table.consAct,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get promedio => $composableBuilder(
    column: $table.promedio,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get serie => $composableBuilder(
    column: $table.serie,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lectRev => $composableBuilder(
    column: $table.lectRev,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nlLc => $composableBuilder(
    column: $table.nlLc,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get observacion => $composableBuilder(
    column: $table.observacion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get sincronizada => $composableBuilder(
    column: $table.sincronizada,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remoteId => $composableBuilder(
    column: $table.remoteId,
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

  ColumnOrderings<String> get codigo => $composableBuilder(
    column: $table.codigo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nombreCliente => $composableBuilder(
    column: $table.nombreCliente,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get direccion => $composableBuilder(
    column: $table.direccion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lectAnt => $composableBuilder(
    column: $table.lectAnt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get consAnt => $composableBuilder(
    column: $table.consAnt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lectAct => $composableBuilder(
    column: $table.lectAct,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get consAct => $composableBuilder(
    column: $table.consAct,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get promedio => $composableBuilder(
    column: $table.promedio,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get serie => $composableBuilder(
    column: $table.serie,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lectRev => $composableBuilder(
    column: $table.lectRev,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nlLc => $composableBuilder(
    column: $table.nlLc,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get observacion => $composableBuilder(
    column: $table.observacion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get sincronizada => $composableBuilder(
    column: $table.sincronizada,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remoteId => $composableBuilder(
    column: $table.remoteId,
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

  GeneratedColumn<String> get codigo =>
      $composableBuilder(column: $table.codigo, builder: (column) => column);

  GeneratedColumn<String> get nombreCliente => $composableBuilder(
    column: $table.nombreCliente,
    builder: (column) => column,
  );

  GeneratedColumn<String> get direccion =>
      $composableBuilder(column: $table.direccion, builder: (column) => column);

  GeneratedColumn<double> get lectAnt =>
      $composableBuilder(column: $table.lectAnt, builder: (column) => column);

  GeneratedColumn<double> get consAnt =>
      $composableBuilder(column: $table.consAnt, builder: (column) => column);

  GeneratedColumn<double> get lectAct =>
      $composableBuilder(column: $table.lectAct, builder: (column) => column);

  GeneratedColumn<double> get consAct =>
      $composableBuilder(column: $table.consAct, builder: (column) => column);

  GeneratedColumn<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => column,
  );

  GeneratedColumn<double> get promedio =>
      $composableBuilder(column: $table.promedio, builder: (column) => column);

  GeneratedColumn<String> get serie =>
      $composableBuilder(column: $table.serie, builder: (column) => column);

  GeneratedColumn<double> get lectRev =>
      $composableBuilder(column: $table.lectRev, builder: (column) => column);

  GeneratedColumn<String> get nlLc =>
      $composableBuilder(column: $table.nlLc, builder: (column) => column);

  GeneratedColumn<String> get observacion => $composableBuilder(
    column: $table.observacion,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get sincronizada => $composableBuilder(
    column: $table.sincronizada,
    builder: (column) => column,
  );

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

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
                Value<String> codigo = const Value.absent(),
                Value<String?> nombreCliente = const Value.absent(),
                Value<String?> direccion = const Value.absent(),
                Value<double?> lectAnt = const Value.absent(),
                Value<double?> consAnt = const Value.absent(),
                Value<double?> lectAct = const Value.absent(),
                Value<double?> consAct = const Value.absent(),
                Value<String?> descripcion = const Value.absent(),
                Value<double?> promedio = const Value.absent(),
                Value<String?> serie = const Value.absent(),
                Value<double?> lectRev = const Value.absent(),
                Value<String?> nlLc = const Value.absent(),
                Value<String> observacion = const Value.absent(),
                Value<bool> sincronizada = const Value.absent(),
                Value<String?> remoteId = const Value.absent(),
              }) => LecturasCompanion(
                id: id,
                rutaId: rutaId,
                codigo: codigo,
                nombreCliente: nombreCliente,
                direccion: direccion,
                lectAnt: lectAnt,
                consAnt: consAnt,
                lectAct: lectAct,
                consAct: consAct,
                descripcion: descripcion,
                promedio: promedio,
                serie: serie,
                lectRev: lectRev,
                nlLc: nlLc,
                observacion: observacion,
                sincronizada: sincronizada,
                remoteId: remoteId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int rutaId,
                required String codigo,
                Value<String?> nombreCliente = const Value.absent(),
                Value<String?> direccion = const Value.absent(),
                Value<double?> lectAnt = const Value.absent(),
                Value<double?> consAnt = const Value.absent(),
                Value<double?> lectAct = const Value.absent(),
                Value<double?> consAct = const Value.absent(),
                Value<String?> descripcion = const Value.absent(),
                Value<double?> promedio = const Value.absent(),
                Value<String?> serie = const Value.absent(),
                Value<double?> lectRev = const Value.absent(),
                Value<String?> nlLc = const Value.absent(),
                Value<String> observacion = const Value.absent(),
                Value<bool> sincronizada = const Value.absent(),
                Value<String?> remoteId = const Value.absent(),
              }) => LecturasCompanion.insert(
                id: id,
                rutaId: rutaId,
                codigo: codigo,
                nombreCliente: nombreCliente,
                direccion: direccion,
                lectAnt: lectAnt,
                consAnt: consAnt,
                lectAct: lectAct,
                consAct: consAct,
                descripcion: descripcion,
                promedio: promedio,
                serie: serie,
                lectRev: lectRev,
                nlLc: nlLc,
                observacion: observacion,
                sincronizada: sincronizada,
                remoteId: remoteId,
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
