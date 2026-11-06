import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InsigniasRecord extends FirestoreRecord {
  InsigniasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  // "imagen" field.
  String? _imagen;
  String get imagen => _imagen ?? '';
  bool hasImagen() => _imagen != null;

  // "archivada" field.
  bool? _archivada;
  bool get archivada => _archivada ?? false;
  bool hasArchivada() => _archivada != null;

  // "fecha_creacion" field.
  DateTime? _fechaCreacion;
  DateTime? get fechaCreacion => _fechaCreacion;
  bool hasFechaCreacion() => _fechaCreacion != null;

  // "fecha_actualizacion" field.
  DateTime? _fechaActualizacion;
  DateTime? get fechaActualizacion => _fechaActualizacion;
  bool hasFechaActualizacion() => _fechaActualizacion != null;

  void _initializeFields() {
    _nombre = snapshotData['nombre'] as String?;
    _descripcion = snapshotData['descripcion'] as String?;
    _imagen = snapshotData['imagen'] as String?;
    _archivada = snapshotData['archivada'] as bool?;
    _fechaCreacion = snapshotData['fecha_creacion'] as DateTime?;
    _fechaActualizacion = snapshotData['fecha_actualizacion'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('insignias');

  static Stream<InsigniasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InsigniasRecord.fromSnapshot(s));

  static Future<InsigniasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InsigniasRecord.fromSnapshot(s));

  static InsigniasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InsigniasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InsigniasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InsigniasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InsigniasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InsigniasRecord && reference.path == other.reference.path;
}

Map<String, dynamic> createInsigniasRecordData({
  String? nombre,
  String? descripcion,
  String? imagen,
  bool? archivada,
  DateTime? fechaCreacion,
  DateTime? fechaActualizacion,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombre': nombre,
      'descripcion': descripcion,
      'imagen': imagen,
      'archivada': archivada,
      'fecha_creacion': fechaCreacion,
      'fecha_actualizacion': fechaActualizacion,
    }.withoutNulls,
  );

  return firestoreData;
}

class InsigniasRecordDocumentEquality implements Equality<InsigniasRecord> {
  const InsigniasRecordDocumentEquality();

  @override
  bool equals(InsigniasRecord? e1, InsigniasRecord? e2) {
    return e1?.nombre == e2?.nombre &&
        e1?.descripcion == e2?.descripcion &&
        e1?.imagen == e2?.imagen &&
        e1?.archivada == e2?.archivada &&
        e1?.fechaCreacion == e2?.fechaCreacion &&
        e1?.fechaActualizacion == e2?.fechaActualizacion;
  }

  @override
  int hash(InsigniasRecord? e) => const ListEquality().hash([
        e?.nombre,
        e?.descripcion,
        e?.imagen,
        e?.archivada,
        e?.fechaCreacion,
        e?.fechaActualizacion
      ]);

  @override
  bool isValidKey(Object? o) => o is InsigniasRecord;
}
