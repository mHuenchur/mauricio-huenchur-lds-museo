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

  // "insignia_ref" field.
  DocumentReference? _insigniaRef;
  DocumentReference? get insigniaRef => _insigniaRef;
  bool hasInsigniaRef() => _insigniaRef != null;

  // "insignia_nombre" field.
  String? _insigniaNombre;
  String get insigniaNombre => _insigniaNombre ?? '';
  bool hasInsigniaNombre() => _insigniaNombre != null;

  // "insignia_descripcion" field.
  String? _insigniaDescripcion;
  String get insigniaDescripcion => _insigniaDescripcion ?? '';
  bool hasInsigniaDescripcion() => _insigniaDescripcion != null;

  // "insignia_imagen" field.
  String? _insigniaImagen;
  String get insigniaImagen => _insigniaImagen ?? '';
  bool hasInsigniaImagen() => _insigniaImagen != null;

  // "nombre_mision_inicio" field.
  String? _nombreMisionInicio;
  String get nombreMisionInicio => _nombreMisionInicio ?? '';
  bool hasNombreMisionInicio() => _nombreMisionInicio != null;

  void _initializeFields() {
    _visitanteId = snapshotData['visitante_id'] as String?;
    _misionId = snapshotData['mision_id'] as String?;
    _numeroDesafioActual =
        castToType<int>(snapshotData['numero_desafio_actual']);
    _misionCompletada = snapshotData['mision_completada'] as bool?;
    _puntosTotalesGanados =
        castToType<int>(snapshotData['puntos_totales_ganados']);
    _insigniaRef = snapshotData['insignia_ref'] as DocumentReference?;
    _insigniaNombre = snapshotData['insignia_nombre'] as String?;
    _insigniaDescripcion = snapshotData['insignia_descripcion'] as String?;
    _insigniaImagen = snapshotData['insignia_imagen'] as String?;
    _nombreMisionInicio = snapshotData['nombre_mision_inicio'] as String?;
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
  DocumentReference? insigniaRef,
  String? insigniaNombre,
  String? insigniaDescripcion,
  String? insigniaImagen,
  String? nombreMisionInicio,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'visitante_id': visitanteId,
      'mision_id': misionId,
      'numero_desafio_actual': numeroDesafioActual,
      'mision_completada': misionCompletada,
      'puntos_totales_ganados': puntosTotalesGanados,
      'insignia_ref': insigniaRef,
      'insignia_nombre': insigniaNombre,
      'insignia_descripcion': insigniaDescripcion,
      'insignia_imagen': insigniaImagen,
      'nombre_mision_inicio': nombreMisionInicio,
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
        e1?.puntosTotalesGanados == e2?.puntosTotalesGanados &&
        e1?.insigniaRef == e2?.insigniaRef &&
        e1?.insigniaNombre == e2?.insigniaNombre &&
        e1?.insigniaDescripcion == e2?.insigniaDescripcion &&
        e1?.insigniaImagen == e2?.insigniaImagen &&
        e1?.nombreMisionInicio == e2?.nombreMisionInicio;
  }

  @override
  int hash(ProgresoMisionVisitanteRecord? e) => const ListEquality().hash([
        e?.visitanteId,
        e?.misionId,
        e?.numeroDesafioActual,
        e?.misionCompletada,
        e?.puntosTotalesGanados,
        e?.insigniaRef,
        e?.insigniaNombre,
        e?.insigniaDescripcion,
        e?.insigniaImagen,
        e?.nombreMisionInicio
      ]);

  @override
  bool isValidKey(Object? o) => o is ProgresoMisionVisitanteRecord;
}
