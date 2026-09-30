import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DesafiosRecord extends FirestoreRecord {
  DesafiosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "mision_desafio_fk" field.
  DocumentReference? _misionDesafioFk;
  DocumentReference? get misionDesafioFk => _misionDesafioFk;
  bool hasMisionDesafioFk() => _misionDesafioFk != null;

  // "numero_orden" field.
  int? _numeroOrden;
  int get numeroOrden => _numeroOrden ?? 0;
  bool hasNumeroOrden() => _numeroOrden != null;

  // "pista_busqueda" field.
  String? _pistaBusqueda;
  String get pistaBusqueda => _pistaBusqueda ?? '';
  bool hasPistaBusqueda() => _pistaBusqueda != null;

  // "pista_extra" field.
  String? _pistaExtra;
  String get pistaExtra => _pistaExtra ?? '';
  bool hasPistaExtra() => _pistaExtra != null;

  // "info_historica" field.
  String? _infoHistorica;
  String get infoHistorica => _infoHistorica ?? '';
  bool hasInfoHistorica() => _infoHistorica != null;

  // "tipo_validacion" field.
  String? _tipoValidacion;
  String get tipoValidacion => _tipoValidacion ?? '';
  bool hasTipoValidacion() => _tipoValidacion != null;

  // "prompt_oculto" field.
  String? _promptOculto;
  String get promptOculto => _promptOculto ?? '';
  bool hasPromptOculto() => _promptOculto != null;

  // "valor_puntos" field.
  int? _valorPuntos;
  int get valorPuntos => _valorPuntos ?? 0;
  bool hasValorPuntos() => _valorPuntos != null;

  void _initializeFields() {
    _misionDesafioFk = snapshotData['mision_desafio_fk'] as DocumentReference?;
    _numeroOrden = castToType<int>(snapshotData['numero_orden']);
    _pistaBusqueda = snapshotData['pista_busqueda'] as String?;
    _pistaExtra = snapshotData['pista_extra'] as String?;
    _infoHistorica = snapshotData['info_historica'] as String?;
    _tipoValidacion = snapshotData['tipo_validacion'] as String?;
    _promptOculto = snapshotData['prompt_oculto'] as String?;
    _valorPuntos = castToType<int>(snapshotData['valor_puntos']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('desafios');

  static Stream<DesafiosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DesafiosRecord.fromSnapshot(s));

  static Future<DesafiosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DesafiosRecord.fromSnapshot(s));

  static DesafiosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DesafiosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DesafiosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DesafiosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DesafiosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DesafiosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDesafiosRecordData({
  DocumentReference? misionDesafioFk,
  int? numeroOrden,
  String? pistaBusqueda,
  String? pistaExtra,
  String? infoHistorica,
  String? tipoValidacion,
  String? promptOculto,
  int? valorPuntos,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'mision_desafio_fk': misionDesafioFk,
      'numero_orden': numeroOrden,
      'pista_busqueda': pistaBusqueda,
      'pista_extra': pistaExtra,
      'info_historica': infoHistorica,
      'tipo_validacion': tipoValidacion,
      'prompt_oculto': promptOculto,
      'valor_puntos': valorPuntos,
    }.withoutNulls,
  );

  return firestoreData;
}

class DesafiosRecordDocumentEquality implements Equality<DesafiosRecord> {
  const DesafiosRecordDocumentEquality();

  @override
  bool equals(DesafiosRecord? e1, DesafiosRecord? e2) {
    return e1?.misionDesafioFk == e2?.misionDesafioFk &&
        e1?.numeroOrden == e2?.numeroOrden &&
        e1?.pistaBusqueda == e2?.pistaBusqueda &&
        e1?.pistaExtra == e2?.pistaExtra &&
        e1?.infoHistorica == e2?.infoHistorica &&
        e1?.tipoValidacion == e2?.tipoValidacion &&
        e1?.promptOculto == e2?.promptOculto &&
        e1?.valorPuntos == e2?.valorPuntos;
  }

  @override
  int hash(DesafiosRecord? e) => const ListEquality().hash([
        e?.misionDesafioFk,
        e?.numeroOrden,
        e?.pistaBusqueda,
        e?.pistaExtra,
        e?.infoHistorica,
        e?.tipoValidacion,
        e?.promptOculto,
        e?.valorPuntos
      ]);

  @override
  bool isValidKey(Object? o) => o is DesafiosRecord;
}
