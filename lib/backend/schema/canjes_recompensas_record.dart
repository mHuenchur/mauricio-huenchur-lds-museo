import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CanjesRecompensasRecord extends FirestoreRecord {
  CanjesRecompensasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "usuario_ref" field.
  DocumentReference? _usuarioRef;
  DocumentReference? get usuarioRef => _usuarioRef;
  bool hasUsuarioRef() => _usuarioRef != null;

  // "recompensa_ref" field.
  DocumentReference? _recompensaRef;
  DocumentReference? get recompensaRef => _recompensaRef;
  bool hasRecompensaRef() => _recompensaRef != null;

  // "nombre_recompensa" field.
  String? _nombreRecompensa;
  String get nombreRecompensa => _nombreRecompensa ?? '';
  bool hasNombreRecompensa() => _nombreRecompensa != null;

  // "tipo_recompensa" field.
  String? _tipoRecompensa;
  String get tipoRecompensa => _tipoRecompensa ?? '';
  bool hasTipoRecompensa() => _tipoRecompensa != null;

  // "condiciones" field.
  String? _condiciones;
  String get condiciones => _condiciones ?? '';
  bool hasCondiciones() => _condiciones != null;

  // "porcentaje_descuento" field.
  int? _porcentajeDescuento;
  int get porcentajeDescuento => _porcentajeDescuento ?? 0;
  bool hasPorcentajeDescuento() => _porcentajeDescuento != null;

  // "puntos_gastados" field.
  int? _puntosGastados;
  int get puntosGastados => _puntosGastados ?? 0;
  bool hasPuntosGastados() => _puntosGastados != null;

  // "estado" field.
  String? _estado;
  String get estado => _estado ?? '';
  bool hasEstado() => _estado != null;

  // "fecha_canje" field.
  DateTime? _fechaCanje;
  DateTime? get fechaCanje => _fechaCanje;
  bool hasFechaCanje() => _fechaCanje != null;

  // "fecha_utilizacion" field.
  DateTime? _fechaUtilizacion;
  DateTime? get fechaUtilizacion => _fechaUtilizacion;
  bool hasFechaUtilizacion() => _fechaUtilizacion != null;

  // "validado_por" field.
  DocumentReference? _validadoPor;
  DocumentReference? get validadoPor => _validadoPor;
  bool hasValidadoPor() => _validadoPor != null;

  void _initializeFields() {
    _usuarioRef = snapshotData['usuario_ref'] as DocumentReference?;
    _recompensaRef = snapshotData['recompensa_ref'] as DocumentReference?;
    _nombreRecompensa = snapshotData['nombre_recompensa'] as String?;
    _tipoRecompensa = snapshotData['tipo_recompensa'] as String?;
    _condiciones = snapshotData['condiciones'] as String?;
    _porcentajeDescuento =
        castToType<int>(snapshotData['porcentaje_descuento']);
    _puntosGastados = castToType<int>(snapshotData['puntos_gastados']);
    _estado = snapshotData['estado'] as String?;
    _fechaCanje = snapshotData['fecha_canje'] as DateTime?;
    _fechaUtilizacion = snapshotData['fecha_utilizacion'] as DateTime?;
    _validadoPor = snapshotData['validado_por'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('canjes_recompensas');

  static Stream<CanjesRecompensasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CanjesRecompensasRecord.fromSnapshot(s));

  static Future<CanjesRecompensasRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CanjesRecompensasRecord.fromSnapshot(s));

  static CanjesRecompensasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CanjesRecompensasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CanjesRecompensasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CanjesRecompensasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CanjesRecompensasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CanjesRecompensasRecord &&
      reference.path == other.reference.path;
}

Map<String, dynamic> createCanjesRecompensasRecordData({
  DocumentReference? usuarioRef,
  DocumentReference? recompensaRef,
  String? nombreRecompensa,
  String? tipoRecompensa,
  String? condiciones,
  int? porcentajeDescuento,
  int? puntosGastados,
  String? estado,
  DateTime? fechaCanje,
  DateTime? fechaUtilizacion,
  DocumentReference? validadoPor,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'usuario_ref': usuarioRef,
      'recompensa_ref': recompensaRef,
      'nombre_recompensa': nombreRecompensa,
      'tipo_recompensa': tipoRecompensa,
      'condiciones': condiciones,
      'porcentaje_descuento': porcentajeDescuento,
      'puntos_gastados': puntosGastados,
      'estado': estado,
      'fecha_canje': fechaCanje,
      'fecha_utilizacion': fechaUtilizacion,
      'validado_por': validadoPor,
    }.withoutNulls,
  );

  return firestoreData;
}

class CanjesRecompensasRecordDocumentEquality
    implements Equality<CanjesRecompensasRecord> {
  const CanjesRecompensasRecordDocumentEquality();

  @override
  bool equals(CanjesRecompensasRecord? e1, CanjesRecompensasRecord? e2) {
    return e1?.usuarioRef == e2?.usuarioRef &&
        e1?.recompensaRef == e2?.recompensaRef &&
        e1?.nombreRecompensa == e2?.nombreRecompensa &&
        e1?.tipoRecompensa == e2?.tipoRecompensa &&
        e1?.condiciones == e2?.condiciones &&
        e1?.porcentajeDescuento == e2?.porcentajeDescuento &&
        e1?.puntosGastados == e2?.puntosGastados &&
        e1?.estado == e2?.estado &&
        e1?.fechaCanje == e2?.fechaCanje &&
        e1?.fechaUtilizacion == e2?.fechaUtilizacion &&
        e1?.validadoPor == e2?.validadoPor;
  }

  @override
  int hash(CanjesRecompensasRecord? e) => const ListEquality().hash([
        e?.usuarioRef,
        e?.recompensaRef,
        e?.nombreRecompensa,
        e?.tipoRecompensa,
        e?.condiciones,
        e?.porcentajeDescuento,
        e?.puntosGastados,
        e?.estado,
        e?.fechaCanje,
        e?.fechaUtilizacion,
        e?.validadoPor
      ]);

  @override
  bool isValidKey(Object? o) => o is CanjesRecompensasRecord;
}
