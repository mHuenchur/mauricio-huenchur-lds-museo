import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'recompensas_visitante_widget.dart' show RecompensasVisitanteWidget;
import 'package:flutter/material.dart';

class RecompensasVisitanteModel
    extends FlutterFlowModel<RecompensasVisitanteWidget> {
  ///  Local state fields for this page.

  bool procesandoCanje = false;

  String? ultimoCanjeId;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Cloud Function - canjearRecompensa] action in Button widget.
  CanjearRecompensaCloudFunctionCallResponse? resultadoCanje;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
