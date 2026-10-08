import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProgresoMisionVisitanteRecord extends FirestoreRecord {
  ProgresoMisionVisitanteRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "visitante_id" field.
  String? _visitanteId;
  String get visitanteId => _visitanteId ?? '';
  bool hasVisitanteId() => _visitanteId != null;

  // "mision_id" field.
  String? _misionId;
  String get misionId => _misionId ?? '';
  bool hasMisionId() => _misionId != null;

  // "numero_desafio_actual" field.
  int? _numeroDesafioActual;
  int get numeroDesafioActual => _numeroDesafioActual ?? 0;
  bool hasNumeroDesafioActual() => _numeroDesafioActual != null;

  // "mision_completada" field.
  bool? _misionCompletada;
  bool get misionCompletada => _misionCompletada ?? false;
  bool hasMisionCompletada() => _misionCompletada != null;

  // "puntos_totales_ganados" field.
  int? _puntosTotalesGanados;
  int get puntosTotalesGanados => _puntosTotalesGanados ?? 0;
  bool hasPuntosTotalesGanados() => _puntosTotalesGanados != null;

  void _initializeFields() {
    _visitanteId = snapshotData['visitante_id'] as String?;
    _misionId = snapshotData['mision_id'] as String?;
    _numeroDesafioActual =
        castToType<int>(snapshotData['numero_desafio_actual']);
    _misionCompletada = snapshotData['mision_completada'] as bool?;
    _puntosTotalesGanados =
        castToType<int>(snapshotData['puntos_totales_ganados']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('progreso_mision_visitante');

  static Stream<ProgresoMisionVisitanteRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => ProgresoMisionVisitanteRecord.fromSnapshot(s));

  static Future<ProgresoMisionVisitanteRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ProgresoMisionVisitanteRecord.fromSnapshot(s));

  static ProgresoMisionVisitanteRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      ProgresoMisionVisitanteRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProgresoMisionVisitanteRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProgresoMisionVisitanteRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProgresoMisionVisitanteRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProgresoMisionVisitanteRecord &&
      reference.path == other.reference.path;
}

Map<String, dynamic> createProgresoMisionVisitanteRecordData({
  String? visitanteId,
  String? misionId,
  int? numeroDesafioActual,
  bool? misionCompletada,
  int? puntosTotalesGanados,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'visitante_id': visitanteId,
      'mision_id': misionId,
      'numero_desafio_actual': numeroDesafioActual,
      'mision_completada': misionCompletada,
      'puntos_totales_ganados': puntosTotalesGanados,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProgresoMisionVisitanteRecordDocumentEquality
    implements Equality<ProgresoMisionVisitanteRecord> {
  const ProgresoMisionVisitanteRecordDocumentEquality();

  @override
  bool equals(
      ProgresoMisionVisitanteRecord? e1, ProgresoMisionVisitanteRecord? e2) {
    return e1?.visitanteId == e2?.visitanteId &&
        e1?.misionId == e2?.misionId &&
        e1?.numeroDesafioActual == e2?.numeroDesafioActual &&
        e1?.misionCompletada == e2?.misionCompletada &&
        e1?.puntosTotalesGanados == e2?.puntosTotalesGanados;
  }

  @override
  int hash(ProgresoMisionVisitanteRecord? e) => const ListEquality().hash([
        e?.visitanteId,
        e?.misionId,
        e?.numeroDesafioActual,
        e?.misionCompletada,
        e?.puntosTotalesGanados
      ]);

  @override
  bool isValidKey(Object? o) => o is ProgresoMisionVisitanteRecord;
}
