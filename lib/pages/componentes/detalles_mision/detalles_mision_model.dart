import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'detalles_mision_widget.dart' show DetallesMisionWidget;
import 'package:flutter/material.dart';

class DetallesMisionModel extends FlutterFlowModel<DetallesMisionWidget> {
  ///  Local state fields for this component.

  InsigniasRecord? insigniaAlInicio;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? totalDesafios;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ProgresoMisionVisitanteRecord? progresoExistente;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  MisionesRecord? misionLeida;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  InsigniasRecord? insigniaConsultada;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ProgresoMisionVisitanteRecord? progresoCreado;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
