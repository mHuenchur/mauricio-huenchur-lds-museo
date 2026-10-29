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

  // "esta_archivada" field.
  bool? _estaArchivada;
  bool get estaArchivada => _estaArchivada ?? false;
  bool hasEstaArchivada() => _estaArchivada != null;

  void _initializeFields() {
    _nombreSala = snapshotData['nombre_sala'] as String?;
    _estaArchivada = snapshotData['esta_archivada'] as bool?;
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
      other is SalasRecord && reference.path == other.reference.path;
}

Map<String, dynamic> createSalasRecordData({
  String? nombreSala,
  bool? estaArchivada,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombre_sala': nombreSala,
      'esta_archivada': estaArchivada,
    }.withoutNulls,
  );

  return firestoreData;
}

class SalasRecordDocumentEquality implements Equality<SalasRecord> {
  const SalasRecordDocumentEquality();

  @override
  bool equals(SalasRecord? e1, SalasRecord? e2) {
    return e1?.nombreSala == e2?.nombreSala &&
        e1?.estaArchivada == e2?.estaArchivada;
  }

  @override
  int hash(SalasRecord? e) =>
      const ListEquality().hash([e?.nombreSala, e?.estaArchivada]);

  @override
  bool isValidKey(Object? o) => o is SalasRecord;
}
