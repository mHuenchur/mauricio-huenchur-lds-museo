// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart' hide Type;

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DatosCuponStruct extends FFFirebaseStruct {
  DatosCuponStruct({
    String? canjeId,
    String? nombre,
    String? condiciones,
    String? estado,
    String? tipo,
    int? porcentaje,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _canjeId = canjeId,
        _nombre = nombre,
        _condiciones = condiciones,
        _estado = estado,
        _tipo = tipo,
        _porcentaje = porcentaje,
        super(firestoreUtilData);

  // "canjeId" field.
  String? _canjeId;
  String get canjeId => _canjeId ?? '';
  set canjeId(String? val) => _canjeId = val;

  bool hasCanjeId() => _canjeId != null;

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  set nombre(String? val) => _nombre = val;

  bool hasNombre() => _nombre != null;

  // "condiciones" field.
  String? _condiciones;
  String get condiciones => _condiciones ?? '';
  set condiciones(String? val) => _condiciones = val;

  bool hasCondiciones() => _condiciones != null;

  // "estado" field.
  String? _estado;
  String get estado => _estado ?? '';
  set estado(String? val) => _estado = val;

  bool hasEstado() => _estado != null;

  // "tipo" field.
  String? _tipo;
  String get tipo => _tipo ?? '';
  set tipo(String? val) => _tipo = val;

  bool hasTipo() => _tipo != null;

  // "porcentaje" field.
  int? _porcentaje;
  int get porcentaje => _porcentaje ?? 0;
  set porcentaje(int? val) => _porcentaje = val;

  void incrementPorcentaje(int amount) => porcentaje = porcentaje + amount;

  bool hasPorcentaje() => _porcentaje != null;

  static DatosCuponStruct fromMap(Map<String, dynamic> data) =>
      DatosCuponStruct(
        canjeId: data['canjeId'] as String?,
        nombre: data['nombre'] as String?,
        condiciones: data['condiciones'] as String?,
        estado: data['estado'] as String?,
        tipo: data['tipo'] as String?,
        porcentaje: castToType<int>(data['porcentaje']),
      );

  static DatosCuponStruct? maybeFromMap(dynamic data) => data is Map
      ? DatosCuponStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'canjeId': _canjeId,
        'nombre': _nombre,
        'condiciones': _condiciones,
        'estado': _estado,
        'tipo': _tipo,
        'porcentaje': _porcentaje,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'canjeId': serializeParam(
          _canjeId,
          ParamType.String,
        ),
        'nombre': serializeParam(
          _nombre,
          ParamType.String,
        ),
        'condiciones': serializeParam(
          _condiciones,
          ParamType.String,
        ),
        'estado': serializeParam(
          _estado,
          ParamType.String,
        ),
        'tipo': serializeParam(
          _tipo,
          ParamType.String,
        ),
        'porcentaje': serializeParam(
          _porcentaje,
          ParamType.int,
        ),
      }.withoutNulls;

  static DatosCuponStruct fromSerializableMap(Map<String, dynamic> data) =>
      DatosCuponStruct(
        canjeId: deserializeParam(
          data['canjeId'],
          ParamType.String,
          false,
        ),
        nombre: deserializeParam(
          data['nombre'],
          ParamType.String,
          false,
        ),
        condiciones: deserializeParam(
          data['condiciones'],
          ParamType.String,
          false,
        ),
        estado: deserializeParam(
          data['estado'],
          ParamType.String,
          false,
        ),
        tipo: deserializeParam(
          data['tipo'],
          ParamType.String,
          false,
        ),
        porcentaje: deserializeParam(
          data['porcentaje'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'DatosCuponStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DatosCuponStruct &&
        canjeId == other.canjeId &&
        nombre == other.nombre &&
        condiciones == other.condiciones &&
        estado == other.estado &&
        tipo == other.tipo &&
        porcentaje == other.porcentaje;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([canjeId, nombre, condiciones, estado, tipo, porcentaje]);
}

DatosCuponStruct createDatosCuponStruct({
  String? canjeId,
  String? nombre,
  String? condiciones,
  String? estado,
  String? tipo,
  int? porcentaje,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DatosCuponStruct(
      canjeId: canjeId,
      nombre: nombre,
      condiciones: condiciones,
      estado: estado,
      tipo: tipo,
      porcentaje: porcentaje,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DatosCuponStruct? updateDatosCuponStruct(
  DatosCuponStruct? datosCupon, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    datosCupon
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDatosCuponStructData(
  Map<String, dynamic> firestoreData,
  DatosCuponStruct? datosCupon,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (datosCupon == null) {
    return;
  }
  if (datosCupon.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && datosCupon.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final datosCuponData = getDatosCuponFirestoreData(datosCupon, forFieldValue);
  final nestedData = datosCuponData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = datosCupon.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDatosCuponFirestoreData(
  DatosCuponStruct? datosCupon, [
  bool forFieldValue = false,
]) {
  if (datosCupon == null) {
    return {};
  }
  final firestoreData = mapToFirestore(datosCupon.toMap());

  // Add any Firestore field values
  mapToFirestore(datosCupon.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDatosCuponListFirestoreData(
  List<DatosCuponStruct>? datosCupons,
) =>
    datosCupons?.map((e) => getDatosCuponFirestoreData(e, true)).toList() ?? [];
