import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ActivacionesPistaExtraRecord extends FirestoreRecord {
  ActivacionesPistaExtraRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "desafio_ref" field.
  DocumentReference? _desafioRef;
  DocumentReference? get desafioRef => _desafioRef;
  bool hasDesafioRef() => _desafioRef != null;

  // "nombre_mision" field.
  String? _nombreMision;
  String get nombreMision => _nombreMision ?? '';
  bool hasNombreMision() => _nombreMision != null;

  // "numero_desafio" field.
  int? _numeroDesafio;
  int get numeroDesafio => _numeroDesafio ?? 0;
  bool hasNumeroDesafio() => _numeroDesafio != null;

  // "fecha_solicitud" field.
  DateTime? _fechaSolicitud;
  DateTime? get fechaSolicitud => _fechaSolicitud;
  bool hasFechaSolicitud() => _fechaSolicitud != null;

  // "progreso_ref" field.
  DocumentReference? _progresoRef;
  DocumentReference? get progresoRef => _progresoRef;
  bool hasProgresoRef() => _progresoRef != null;

  void _initializeFields() {
    _desafioRef = snapshotData['desafio_ref'] as DocumentReference?;
    _nombreMision = snapshotData['nombre_mision'] as String?;
    _numeroDesafio = castToType<int>(snapshotData['numero_desafio']);
    _fechaSolicitud = snapshotData['fecha_solicitud'] as DateTime?;
    _progresoRef = snapshotData['progreso_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('activaciones_pista_extra');

  static Stream<ActivacionesPistaExtraRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => ActivacionesPistaExtraRecord.fromSnapshot(s));

  static Future<ActivacionesPistaExtraRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ActivacionesPistaExtraRecord.fromSnapshot(s));

  static ActivacionesPistaExtraRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ActivacionesPistaExtraRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ActivacionesPistaExtraRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ActivacionesPistaExtraRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ActivacionesPistaExtraRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ActivacionesPistaExtraRecord &&
      reference.path == other.reference.path;
}

Map<String, dynamic> createActivacionesPistaExtraRecordData({
  DocumentReference? desafioRef,
  String? nombreMision,
  int? numeroDesafio,
  DateTime? fechaSolicitud,
  DocumentReference? progresoRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'desafio_ref': desafioRef,
      'nombre_mision': nombreMision,
      'numero_desafio': numeroDesafio,
      'fecha_solicitud': fechaSolicitud,
      'progreso_ref': progresoRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class ActivacionesPistaExtraRecordDocumentEquality
    implements Equality<ActivacionesPistaExtraRecord> {
  const ActivacionesPistaExtraRecordDocumentEquality();

  @override
  bool equals(
      ActivacionesPistaExtraRecord? e1, ActivacionesPistaExtraRecord? e2) {
    return e1?.desafioRef == e2?.desafioRef &&
        e1?.nombreMision == e2?.nombreMision &&
        e1?.numeroDesafio == e2?.numeroDesafio &&
        e1?.fechaSolicitud == e2?.fechaSolicitud &&
        e1?.progresoRef == e2?.progresoRef;
  }

  @override
  int hash(ActivacionesPistaExtraRecord? e) => const ListEquality().hash([
        e?.desafioRef,
        e?.nombreMision,
        e?.numeroDesafio,
        e?.fechaSolicitud,
        e?.progresoRef
      ]);

  @override
  bool isValidKey(Object? o) => o is ActivacionesPistaExtraRecord;
}
