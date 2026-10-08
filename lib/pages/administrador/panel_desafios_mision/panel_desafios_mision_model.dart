import '/flutter_flow/flutter_flow_util.dart';
import 'panel_desafios_mision_widget.dart' show PanelDesafiosMisionWidget;
import 'package:flutter/material.dart';

class PanelDesafiosMisionModel
    extends FlutterFlowModel<PanelDesafiosMisionWidget> {
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
