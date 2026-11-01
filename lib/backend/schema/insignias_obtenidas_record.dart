import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InsigniasObtenidasRecord extends FirestoreRecord {
  InsigniasObtenidasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "visitante_ref" field.
  DocumentReference? _visitanteRef;
  DocumentReference? get visitanteRef => _visitanteRef;
  bool hasVisitanteRef() => _visitanteRef != null;

  // "insignia_ref" field.
  DocumentReference? _insigniaRef;
  DocumentReference? get insigniaRef => _insigniaRef;
  bool hasInsigniaRef() => _insigniaRef != null;

  // "mision_ref" field.
  DocumentReference? _misionRef;
  DocumentReference? get misionRef => _misionRef;
  bool hasMisionRef() => _misionRef != null;

  // "progreso_ref" field.
  DocumentReference? _progresoRef;
  DocumentReference? get progresoRef => _progresoRef;
  bool hasProgresoRef() => _progresoRef != null;

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

  // "nombre_mision" field.
  String? _nombreMision;
  String get nombreMision => _nombreMision ?? '';
  bool hasNombreMision() => _nombreMision != null;

  // "fecha_obtencion" field.
  DateTime? _fechaObtencion;
  DateTime? get fechaObtencion => _fechaObtencion;
  bool hasFechaObtencion() => _fechaObtencion != null;

  void _initializeFields() {
    _visitanteRef = snapshotData['visitante_ref'] as DocumentReference?;
    _insigniaRef = snapshotData['insignia_ref'] as DocumentReference?;
    _misionRef = snapshotData['mision_ref'] as DocumentReference?;
    _progresoRef = snapshotData['progreso_ref'] as DocumentReference?;
    _nombre = snapshotData['nombre'] as String?;
    _descripcion = snapshotData['descripcion'] as String?;
    _imagen = snapshotData['imagen'] as String?;
    _nombreMision = snapshotData['nombre_mision'] as String?;
    _fechaObtencion = snapshotData['fecha_obtencion'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('insignias_obtenidas');

  static Stream<InsigniasObtenidasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InsigniasObtenidasRecord.fromSnapshot(s));

  static Future<InsigniasObtenidasRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => InsigniasObtenidasRecord.fromSnapshot(s));

  static InsigniasObtenidasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InsigniasObtenidasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InsigniasObtenidasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InsigniasObtenidasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InsigniasObtenidasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InsigniasObtenidasRecord &&
      reference.path == other.reference.path;
}

Map<String, dynamic> createInsigniasObtenidasRecordData({
  DocumentReference? visitanteRef,
  DocumentReference? insigniaRef,
  DocumentReference? misionRef,
  DocumentReference? progresoRef,
  String? nombre,
  String? descripcion,
  String? imagen,
  String? nombreMision,
  DateTime? fechaObtencion,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'visitante_ref': visitanteRef,
      'insignia_ref': insigniaRef,
      'mision_ref': misionRef,
      'progreso_ref': progresoRef,
      'nombre': nombre,
      'descripcion': descripcion,
      'imagen': imagen,
      'nombre_mision': nombreMision,
      'fecha_obtencion': fechaObtencion,
    }.withoutNulls,
  );

  return firestoreData;
}

class InsigniasObtenidasRecordDocumentEquality
    implements Equality<InsigniasObtenidasRecord> {
  const InsigniasObtenidasRecordDocumentEquality();

  @override
  bool equals(InsigniasObtenidasRecord? e1, InsigniasObtenidasRecord? e2) {
    return e1?.visitanteRef == e2?.visitanteRef &&
        e1?.insigniaRef == e2?.insigniaRef &&
        e1?.misionRef == e2?.misionRef &&
        e1?.progresoRef == e2?.progresoRef &&
        e1?.nombre == e2?.nombre &&
        e1?.descripcion == e2?.descripcion &&
        e1?.imagen == e2?.imagen &&
        e1?.nombreMision == e2?.nombreMision &&
        e1?.fechaObtencion == e2?.fechaObtencion;
  }

  @override
  int hash(InsigniasObtenidasRecord? e) => const ListEquality().hash([
        e?.visitanteRef,
        e?.insigniaRef,
        e?.misionRef,
        e?.progresoRef,
        e?.nombre,
        e?.descripcion,
        e?.imagen,
        e?.nombreMision,
        e?.fechaObtencion
      ]);

  @override
  bool isValidKey(Object? o) => o is InsigniasObtenidasRecord;
}
