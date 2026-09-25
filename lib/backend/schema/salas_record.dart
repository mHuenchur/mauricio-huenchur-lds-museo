import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SalasRecord extends FirestoreRecord {
  SalasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nombre_sala" field.
  String? _nombreSala;
  String get nombreSala => _nombreSala ?? '';
  bool hasNombreSala() => _nombreSala != null;

  void _initializeFields() {
    _nombreSala = snapshotData['nombre_sala'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('salas');

  static Stream<SalasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SalasRecord.fromSnapshot(s));

  static Future<SalasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SalasRecord.fromSnapshot(s));

  static SalasRecord fromSnapshot(DocumentSnapshot snapshot) => SalasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SalasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SalasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SalasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SalasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSalasRecordData({
  String? nombreSala,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombre_sala': nombreSala,
    }.withoutNulls,
  );

  return firestoreData;
}

class SalasRecordDocumentEquality implements Equality<SalasRecord> {
  const SalasRecordDocumentEquality();

  @override
  bool equals(SalasRecord? e1, SalasRecord? e2) {
    return e1?.nombreSala == e2?.nombreSala;
  }

  @override
  int hash(SalasRecord? e) => const ListEquality().hash([e?.nombreSala]);

  @override
  bool isValidKey(Object? o) => o is SalasRecord;
}
