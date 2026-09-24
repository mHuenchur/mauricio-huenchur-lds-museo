import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_visitante_widget.dart' show HomeVisitanteWidget;
import 'package:flutter/material.dart';

class HomeVisitanteModel extends FlutterFlowModel<HomeVisitanteWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
