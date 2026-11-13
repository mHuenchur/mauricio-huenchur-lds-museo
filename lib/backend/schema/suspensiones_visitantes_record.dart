import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SuspensionesVisitantesRecord extends FirestoreRecord {
  SuspensionesVisitantesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "fecha_suspension" field.
  DateTime? _fechaSuspension;
  DateTime? get fechaSuspension => _fechaSuspension;
  bool hasFechaSuspension() => _fechaSuspension != null;

  void _initializeFields() {
    _fechaSuspension = snapshotData['fecha_suspension'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('suspensiones_visitantes');

  static Stream<SuspensionesVisitantesRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => SuspensionesVisitantesRecord.fromSnapshot(s));

  static Future<SuspensionesVisitantesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => SuspensionesVisitantesRecord.fromSnapshot(s));

  static SuspensionesVisitantesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SuspensionesVisitantesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SuspensionesVisitantesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SuspensionesVisitantesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SuspensionesVisitantesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SuspensionesVisitantesRecord &&
      reference.path == other.reference.path;
}

Map<String, dynamic> createSuspensionesVisitantesRecordData({
  DateTime? fechaSuspension,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'fecha_suspension': fechaSuspension,
    }.withoutNulls,
  );

  return firestoreData;
}

class SuspensionesVisitantesRecordDocumentEquality
    implements Equality<SuspensionesVisitantesRecord> {
  const SuspensionesVisitantesRecordDocumentEquality();

  @override
  bool equals(
      SuspensionesVisitantesRecord? e1, SuspensionesVisitantesRecord? e2) {
    return e1?.fechaSuspension == e2?.fechaSuspension;
  }

  @override
  int hash(SuspensionesVisitantesRecord? e) =>
      const ListEquality().hash([e?.fechaSuspension]);

  @override
  bool isValidKey(Object? o) => o is SuspensionesVisitantesRecord;
}
