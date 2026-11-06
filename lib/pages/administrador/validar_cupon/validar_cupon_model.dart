import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'validar_cupon_widget.dart' show ValidarCuponWidget;
import 'package:flutter/material.dart';

class ValidarCuponModel extends FlutterFlowModel<ValidarCuponWidget> {
  ///  Local state fields for this page.

  String? codigoCupon;

  DatosCuponStruct? cuponConsultado;
  void updateCuponConsultadoStruct(Function(DatosCuponStruct) updateFn) {
    updateFn(cuponConsultado ??= DatosCuponStruct());
  }

  bool mostrarCupon = false;

  bool? consultandoCupon;

  bool procesandoEntrega = false;

  ///  State fields for stateful widgets in this page.

  var codigoEscaneado = '';
  // Stores action output result for [Cloud Function - consultarCupon] action in Button widget.
  ConsultarCuponCloudFunctionCallResponse? resultadoConsultaQR;
  // State field(s) for txtCodigoCupon widget.
  FocusNode? txtCodigoCuponFocusNode;
  TextEditingController? txtCodigoCuponTextController;
  String? Function(BuildContext, String?)?
      txtCodigoCuponTextControllerValidator;
  // Stores action output result for [Cloud Function - consultarCupon] action in Button widget.
  ConsultarCuponCloudFunctionCallResponse? resultadoConsulta;
  // Stores action output result for [Cloud Function - utilizarCupon] action in Button widget.
  UtilizarCuponCloudFunctionCallResponse? resultadoUso;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtCodigoCuponFocusNode?.dispose();
    txtCodigoCuponTextController?.dispose();
  }
}
