import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ActividadMensualVisitantesRecord extends FirestoreRecord {
  ActividadMensualVisitantesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "visitante_id" field.
  String? _visitanteId;
  String get visitanteId => _visitanteId ?? '';
  bool hasVisitanteId() => _visitanteId != null;

  // "periodo" field.
  String? _periodo;
  String get periodo => _periodo ?? '';
  bool hasPeriodo() => _periodo != null;

  void _initializeFields() {
    _visitanteId = snapshotData['visitante_id'] as String?;
    _periodo = snapshotData['periodo'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('actividad_mensual_visitantes');

  static Stream<ActividadMensualVisitantesRecord> getDocument(
          DocumentReference ref) =>
      ref
          .snapshots()
          .map((s) => ActividadMensualVisitantesRecord.fromSnapshot(s));

  static Future<ActividadMensualVisitantesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ActividadMensualVisitantesRecord.fromSnapshot(s));

  static ActividadMensualVisitantesRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      ActividadMensualVisitantesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ActividadMensualVisitantesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ActividadMensualVisitantesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ActividadMensualVisitantesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ActividadMensualVisitantesRecord &&
      reference.path == other.reference.path;
}

Map<String, dynamic> createActividadMensualVisitantesRecordData({
  String? visitanteId,
  String? periodo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'visitante_id': visitanteId,
      'periodo': periodo,
    }.withoutNulls,
  );

  return firestoreData;
}

class ActividadMensualVisitantesRecordDocumentEquality
    implements Equality<ActividadMensualVisitantesRecord> {
  const ActividadMensualVisitantesRecordDocumentEquality();

  @override
  bool equals(ActividadMensualVisitantesRecord? e1,
      ActividadMensualVisitantesRecord? e2) {
    return e1?.visitanteId == e2?.visitanteId && e1?.periodo == e2?.periodo;
  }

  @override
  int hash(ActividadMensualVisitantesRecord? e) =>
      const ListEquality().hash([e?.visitanteId, e?.periodo]);

  @override
  bool isValidKey(Object? o) => o is ActividadMensualVisitantesRecord;
}
