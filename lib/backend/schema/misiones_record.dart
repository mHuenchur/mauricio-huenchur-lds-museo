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

  // "titulo" field.
  String? _titulo;
  String get titulo => _titulo ?? '';
  bool hasTitulo() => _titulo != null;

  // "introduccion" field.
  String? _introduccion;
  String get introduccion => _introduccion ?? '';
  bool hasIntroduccion() => _introduccion != null;

  // "nombre_sala" field.
  String? _nombreSala;
  String get nombreSala => _nombreSala ?? '';
  bool hasNombreSala() => _nombreSala != null;

  // "dificultad" field.
  String? _dificultad;
  String get dificultad => _dificultad ?? '';
  bool hasDificultad() => _dificultad != null;

  // "esta_activa" field.
  bool? _estaActiva;
  bool get estaActiva => _estaActiva ?? false;
  bool hasEstaActiva() => _estaActiva != null;

  void _initializeFields() {
    _titulo = snapshotData['titulo'] as String?;
    _introduccion = snapshotData['introduccion'] as String?;
    _nombreSala = snapshotData['nombre_sala'] as String?;
    _dificultad = snapshotData['dificultad'] as String?;
    _estaActiva = snapshotData['esta_activa'] as bool?;
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
  String? titulo,
  String? introduccion,
  String? nombreSala,
  String? dificultad,
  bool? estaActiva,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'titulo': titulo,
      'introduccion': introduccion,
      'nombre_sala': nombreSala,
      'dificultad': dificultad,
      'esta_activa': estaActiva,
    }.withoutNulls,
  );

  return firestoreData;
}

class MisionesRecordDocumentEquality implements Equality<MisionesRecord> {
  const MisionesRecordDocumentEquality();

  @override
  bool equals(MisionesRecord? e1, MisionesRecord? e2) {
    return e1?.titulo == e2?.titulo &&
        e1?.introduccion == e2?.introduccion &&
        e1?.nombreSala == e2?.nombreSala &&
        e1?.dificultad == e2?.dificultad &&
        e1?.estaActiva == e2?.estaActiva;
  }

  @override
  int hash(MisionesRecord? e) => const ListEquality().hash([
        e?.titulo,
        e?.introduccion,
        e?.nombreSala,
        e?.dificultad,
        e?.estaActiva
      ]);

  @override
  bool isValidKey(Object? o) => o is MisionesRecord;
}
