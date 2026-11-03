import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RecompensasRecord extends FirestoreRecord {
  RecompensasRecord._(
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

  // "tipo" field.
  String? _tipo;
  String get tipo => _tipo ?? '';
  bool hasTipo() => _tipo != null;

  // "costo_puntos" field.
  int? _costoPuntos;
  int get costoPuntos => _costoPuntos ?? 0;
  bool hasCostoPuntos() => _costoPuntos != null;

  // "condiciones" field.
  String? _condiciones;
  String get condiciones => _condiciones ?? '';
  bool hasCondiciones() => _condiciones != null;

  // "porcentaje_descuento" field.
  int? _porcentajeDescuento;
  int get porcentajeDescuento => _porcentajeDescuento ?? 0;
  bool hasPorcentajeDescuento() => _porcentajeDescuento != null;

  // "stock_limitado" field.
  bool? _stockLimitado;
  bool get stockLimitado => _stockLimitado ?? false;
  bool hasStockLimitado() => _stockLimitado != null;

  // "stock_disponible" field.
  int? _stockDisponible;
  int get stockDisponible => _stockDisponible ?? 0;
  bool hasStockDisponible() => _stockDisponible != null;

  // "archivada" field.
  bool? _archivada;
  bool get archivada => _archivada ?? false;
  bool hasArchivada() => _archivada != null;

  // "fecha_creacion" field.
  DateTime? _fechaCreacion;
  DateTime? get fechaCreacion => _fechaCreacion;
  bool hasFechaCreacion() => _fechaCreacion != null;

  // "fecha_modificacion" field.
  DateTime? _fechaModificacion;
  DateTime? get fechaModificacion => _fechaModificacion;
  bool hasFechaModificacion() => _fechaModificacion != null;

  void _initializeFields() {
    _nombre = snapshotData['nombre'] as String?;
    _descripcion = snapshotData['descripcion'] as String?;
    _imagen = snapshotData['imagen'] as String?;
    _tipo = snapshotData['tipo'] as String?;
    _costoPuntos = castToType<int>(snapshotData['costo_puntos']);
    _condiciones = snapshotData['condiciones'] as String?;
    _porcentajeDescuento =
        castToType<int>(snapshotData['porcentaje_descuento']);
    _stockLimitado = snapshotData['stock_limitado'] as bool?;
    _stockDisponible = castToType<int>(snapshotData['stock_disponible']);
    _archivada = snapshotData['archivada'] as bool?;
    _fechaCreacion = snapshotData['fecha_creacion'] as DateTime?;
    _fechaModificacion = snapshotData['fecha_modificacion'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('recompensas');

  static Stream<RecompensasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RecompensasRecord.fromSnapshot(s));

  static Future<RecompensasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RecompensasRecord.fromSnapshot(s));

  static RecompensasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RecompensasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RecompensasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RecompensasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RecompensasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RecompensasRecord && reference.path == other.reference.path;
}

Map<String, dynamic> createRecompensasRecordData({
  String? nombre,
  String? descripcion,
  String? imagen,
  String? tipo,
  int? costoPuntos,
  String? condiciones,
  int? porcentajeDescuento,
  bool? stockLimitado,
  int? stockDisponible,
  bool? archivada,
  DateTime? fechaCreacion,
  DateTime? fechaModificacion,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombre': nombre,
      'descripcion': descripcion,
      'imagen': imagen,
      'tipo': tipo,
      'costo_puntos': costoPuntos,
      'condiciones': condiciones,
      'porcentaje_descuento': porcentajeDescuento,
      'stock_limitado': stockLimitado,
      'stock_disponible': stockDisponible,
      'archivada': archivada,
      'fecha_creacion': fechaCreacion,
      'fecha_modificacion': fechaModificacion,
    }.withoutNulls,
  );

  return firestoreData;
}

class RecompensasRecordDocumentEquality implements Equality<RecompensasRecord> {
  const RecompensasRecordDocumentEquality();

  @override
  bool equals(RecompensasRecord? e1, RecompensasRecord? e2) {
    return e1?.nombre == e2?.nombre &&
        e1?.descripcion == e2?.descripcion &&
        e1?.imagen == e2?.imagen &&
        e1?.tipo == e2?.tipo &&
        e1?.costoPuntos == e2?.costoPuntos &&
        e1?.condiciones == e2?.condiciones &&
        e1?.porcentajeDescuento == e2?.porcentajeDescuento &&
        e1?.stockLimitado == e2?.stockLimitado &&
        e1?.stockDisponible == e2?.stockDisponible &&
        e1?.archivada == e2?.archivada &&
        e1?.fechaCreacion == e2?.fechaCreacion &&
        e1?.fechaModificacion == e2?.fechaModificacion;
  }

  @override
  int hash(RecompensasRecord? e) => const ListEquality().hash([
        e?.nombre,
        e?.descripcion,
        e?.imagen,
        e?.tipo,
        e?.costoPuntos,
        e?.condiciones,
        e?.porcentajeDescuento,
        e?.stockLimitado,
        e?.stockDisponible,
        e?.archivada,
        e?.fechaCreacion,
        e?.fechaModificacion
      ]);

  @override
  bool isValidKey(Object? o) => o is RecompensasRecord;
}
