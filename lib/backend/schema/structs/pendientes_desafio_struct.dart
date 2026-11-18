// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart' hide Type;

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PendientesDesafioStruct extends FFFirebaseStruct {
  PendientesDesafioStruct({
    String? nombreMision,
    int? numeroDesafio,
    int? cantidad,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _nombreMision = nombreMision,
        _numeroDesafio = numeroDesafio,
        _cantidad = cantidad,
        super(firestoreUtilData);

  // "nombreMision" field.
  String? _nombreMision;
  String get nombreMision => _nombreMision ?? '';
  set nombreMision(String? val) => _nombreMision = val;

  bool hasNombreMision() => _nombreMision != null;

  // "numeroDesafio" field.
  int? _numeroDesafio;
  int get numeroDesafio => _numeroDesafio ?? 0;
  set numeroDesafio(int? val) => _numeroDesafio = val;

  void incrementNumeroDesafio(int amount) =>
      numeroDesafio = numeroDesafio + amount;

  bool hasNumeroDesafio() => _numeroDesafio != null;

  // "cantidad" field.
  int? _cantidad;
  int get cantidad => _cantidad ?? 0;
  set cantidad(int? val) => _cantidad = val;

  void incrementCantidad(int amount) => cantidad = cantidad + amount;

  bool hasCantidad() => _cantidad != null;

  static PendientesDesafioStruct fromMap(Map<String, dynamic> data) =>
      PendientesDesafioStruct(
        nombreMision: data['nombreMision'] as String?,
        numeroDesafio: castToType<int>(data['numeroDesafio']),
        cantidad: castToType<int>(data['cantidad']),
      );

  static PendientesDesafioStruct? maybeFromMap(dynamic data) => data is Map
      ? PendientesDesafioStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'nombreMision': _nombreMision,
        'numeroDesafio': _numeroDesafio,
        'cantidad': _cantidad,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'nombreMision': serializeParam(
          _nombreMision,
          ParamType.String,
        ),
        'numeroDesafio': serializeParam(
          _numeroDesafio,
          ParamType.int,
        ),
        'cantidad': serializeParam(
          _cantidad,
          ParamType.int,
        ),
      }.withoutNulls;

  static PendientesDesafioStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      PendientesDesafioStruct(
        nombreMision: deserializeParam(
          data['nombreMision'],
          ParamType.String,
          false,
        ),
        numeroDesafio: deserializeParam(
          data['numeroDesafio'],
          ParamType.int,
          false,
        ),
        cantidad: deserializeParam(
          data['cantidad'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'PendientesDesafioStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PendientesDesafioStruct &&
        nombreMision == other.nombreMision &&
        numeroDesafio == other.numeroDesafio &&
        cantidad == other.cantidad;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([nombreMision, numeroDesafio, cantidad]);
}

PendientesDesafioStruct createPendientesDesafioStruct({
  String? nombreMision,
  int? numeroDesafio,
  int? cantidad,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PendientesDesafioStruct(
      nombreMision: nombreMision,
      numeroDesafio: numeroDesafio,
      cantidad: cantidad,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PendientesDesafioStruct? updatePendientesDesafioStruct(
  PendientesDesafioStruct? pendientesDesafio, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    pendientesDesafio
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPendientesDesafioStructData(
  Map<String, dynamic> firestoreData,
  PendientesDesafioStruct? pendientesDesafio,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (pendientesDesafio == null) {
    return;
  }
  if (pendientesDesafio.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && pendientesDesafio.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final pendientesDesafioData =
      getPendientesDesafioFirestoreData(pendientesDesafio, forFieldValue);
  final nestedData =
      pendientesDesafioData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = pendientesDesafio.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPendientesDesafioFirestoreData(
  PendientesDesafioStruct? pendientesDesafio, [
  bool forFieldValue = false,
]) {
  if (pendientesDesafio == null) {
    return {};
  }
  final firestoreData = mapToFirestore(pendientesDesafio.toMap());

  // Add any Firestore field values
  mapToFirestore(pendientesDesafio.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPendientesDesafioListFirestoreData(
  List<PendientesDesafioStruct>? pendientesDesafios,
) =>
    pendientesDesafios
        ?.map((e) => getPendientesDesafioFirestoreData(e, true))
        .toList() ??
    [];
