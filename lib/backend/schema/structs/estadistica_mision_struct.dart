// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart' hide Type;

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class EstadisticaMisionStruct extends FFFirebaseStruct {
  EstadisticaMisionStruct({
    String? nombre,
    int? iniciadas,
    int? completadas,
    String? finalizacionTexto,
    double? barraInicios,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _nombre = nombre,
        _iniciadas = iniciadas,
        _completadas = completadas,
        _finalizacionTexto = finalizacionTexto,
        _barraInicios = barraInicios,
        super(firestoreUtilData);

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  set nombre(String? val) => _nombre = val;

  bool hasNombre() => _nombre != null;

  // "iniciadas" field.
  int? _iniciadas;
  int get iniciadas => _iniciadas ?? 0;
  set iniciadas(int? val) => _iniciadas = val;

  void incrementIniciadas(int amount) => iniciadas = iniciadas + amount;

  bool hasIniciadas() => _iniciadas != null;

  // "completadas" field.
  int? _completadas;
  int get completadas => _completadas ?? 0;
  set completadas(int? val) => _completadas = val;

  void incrementCompletadas(int amount) => completadas = completadas + amount;

  bool hasCompletadas() => _completadas != null;

  // "finalizacionTexto" field.
  String? _finalizacionTexto;
  String get finalizacionTexto => _finalizacionTexto ?? '';
  set finalizacionTexto(String? val) => _finalizacionTexto = val;

  bool hasFinalizacionTexto() => _finalizacionTexto != null;

  // "barraInicios" field.
  double? _barraInicios;
  double get barraInicios => _barraInicios ?? 0.0;
  set barraInicios(double? val) => _barraInicios = val;

  void incrementBarraInicios(double amount) =>
      barraInicios = barraInicios + amount;

  bool hasBarraInicios() => _barraInicios != null;

  static EstadisticaMisionStruct fromMap(Map<String, dynamic> data) =>
      EstadisticaMisionStruct(
        nombre: data['nombre'] as String?,
        iniciadas: castToType<int>(data['iniciadas']),
        completadas: castToType<int>(data['completadas']),
        finalizacionTexto: data['finalizacionTexto'] as String?,
        barraInicios: castToType<double>(data['barraInicios']),
      );

  static EstadisticaMisionStruct? maybeFromMap(dynamic data) => data is Map
      ? EstadisticaMisionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'nombre': _nombre,
        'iniciadas': _iniciadas,
        'completadas': _completadas,
        'finalizacionTexto': _finalizacionTexto,
        'barraInicios': _barraInicios,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'nombre': serializeParam(
          _nombre,
          ParamType.String,
        ),
        'iniciadas': serializeParam(
          _iniciadas,
          ParamType.int,
        ),
        'completadas': serializeParam(
          _completadas,
          ParamType.int,
        ),
        'finalizacionTexto': serializeParam(
          _finalizacionTexto,
          ParamType.String,
        ),
        'barraInicios': serializeParam(
          _barraInicios,
          ParamType.double,
        ),
      }.withoutNulls;

  static EstadisticaMisionStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      EstadisticaMisionStruct(
        nombre: deserializeParam(
          data['nombre'],
          ParamType.String,
          false,
        ),
        iniciadas: deserializeParam(
          data['iniciadas'],
          ParamType.int,
          false,
        ),
        completadas: deserializeParam(
          data['completadas'],
          ParamType.int,
          false,
        ),
        finalizacionTexto: deserializeParam(
          data['finalizacionTexto'],
          ParamType.String,
          false,
        ),
        barraInicios: deserializeParam(
          data['barraInicios'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'EstadisticaMisionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EstadisticaMisionStruct &&
        nombre == other.nombre &&
        iniciadas == other.iniciadas &&
        completadas == other.completadas &&
        finalizacionTexto == other.finalizacionTexto &&
        barraInicios == other.barraInicios;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([nombre, iniciadas, completadas, finalizacionTexto, barraInicios]);
}

EstadisticaMisionStruct createEstadisticaMisionStruct({
  String? nombre,
  int? iniciadas,
  int? completadas,
  String? finalizacionTexto,
  double? barraInicios,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    EstadisticaMisionStruct(
      nombre: nombre,
      iniciadas: iniciadas,
      completadas: completadas,
      finalizacionTexto: finalizacionTexto,
      barraInicios: barraInicios,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

EstadisticaMisionStruct? updateEstadisticaMisionStruct(
  EstadisticaMisionStruct? estadisticaMision, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    estadisticaMision
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addEstadisticaMisionStructData(
  Map<String, dynamic> firestoreData,
  EstadisticaMisionStruct? estadisticaMision,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (estadisticaMision == null) {
    return;
  }
  if (estadisticaMision.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && estadisticaMision.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final estadisticaMisionData =
      getEstadisticaMisionFirestoreData(estadisticaMision, forFieldValue);
  final nestedData =
      estadisticaMisionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = estadisticaMision.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getEstadisticaMisionFirestoreData(
  EstadisticaMisionStruct? estadisticaMision, [
  bool forFieldValue = false,
]) {
  if (estadisticaMision == null) {
    return {};
  }
  final firestoreData = mapToFirestore(estadisticaMision.toMap());

  // Add any Firestore field values
  mapToFirestore(estadisticaMision.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getEstadisticaMisionListFirestoreData(
  List<EstadisticaMisionStruct>? estadisticaMisions,
) =>
    estadisticaMisions
        ?.map((e) => getEstadisticaMisionFirestoreData(e, true))
        .toList() ??
    [];
