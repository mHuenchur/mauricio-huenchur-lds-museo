import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MisionesRecord extends FirestoreRecord {
  MisionesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nombre_mision" field.
  String? _nombreMision;
  String get nombreMision => _nombreMision ?? '';
  bool hasNombreMision() => _nombreMision != null;

  // "descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  // "dificultad" field.
  String? _dificultad;
  String get dificultad => _dificultad ?? '';
  bool hasDificultad() => _dificultad != null;

  // "esta_activa" field.
  bool? _estaActiva;
  bool get estaActiva => _estaActiva ?? false;
  bool hasEstaActiva() => _estaActiva != null;

  // "sala_id" field.
  DocumentReference? _salaId;
  DocumentReference? get salaId => _salaId;
  bool hasSalaId() => _salaId != null;

  // "imagen" field.
  String? _imagen;
  String get imagen => _imagen ?? '';
  bool hasImagen() => _imagen != null;

  // "duracion" field.
  int? _duracion;
  int get duracion => _duracion ?? 0;
  bool hasDuracion() => _duracion != null;

  void _initializeFields() {
    _nombreMision = snapshotData['nombre_mision'] as String?;
    _descripcion = snapshotData['descripcion'] as String?;
    _dificultad = snapshotData['dificultad'] as String?;
    _estaActiva = snapshotData['esta_activa'] as bool?;
    _salaId = snapshotData['sala_id'] as DocumentReference?;
    _imagen = snapshotData['imagen'] as String?;
    _duracion = castToType<int>(snapshotData['duracion']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('misiones');

  static Stream<MisionesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MisionesRecord.fromSnapshot(s));

  static Future<MisionesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MisionesRecord.fromSnapshot(s));

  static MisionesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MisionesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MisionesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MisionesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MisionesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MisionesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMisionesRecordData({
  String? nombreMision,
  String? descripcion,
  String? dificultad,
  bool? estaActiva,
  DocumentReference? salaId,
  String? imagen,
  int? duracion,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombre_mision': nombreMision,
      'descripcion': descripcion,
      'dificultad': dificultad,
      'esta_activa': estaActiva,
      'sala_id': salaId,
      'imagen': imagen,
      'duracion': duracion,
    }.withoutNulls,
  );

  return firestoreData;
}

class MisionesRecordDocumentEquality implements Equality<MisionesRecord> {
  const MisionesRecordDocumentEquality();

  @override
  bool equals(MisionesRecord? e1, MisionesRecord? e2) {
    return e1?.nombreMision == e2?.nombreMision &&
        e1?.descripcion == e2?.descripcion &&
        e1?.dificultad == e2?.dificultad &&
        e1?.estaActiva == e2?.estaActiva &&
        e1?.salaId == e2?.salaId &&
        e1?.imagen == e2?.imagen &&
        e1?.duracion == e2?.duracion;
  }

  @override
  int hash(MisionesRecord? e) => const ListEquality().hash([
        e?.nombreMision,
        e?.descripcion,
        e?.dificultad,
        e?.estaActiva,
        e?.salaId,
        e?.imagen,
        e?.duracion
      ]);

  @override
  bool isValidKey(Object? o) => o is MisionesRecord;
}
