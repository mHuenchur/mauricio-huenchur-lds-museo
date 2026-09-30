import '/flutter_flow/flutter_flow_util.dart';
import 'nuevo_desafio_widget.dart' show NuevoDesafioWidget;
import 'package:flutter/material.dart';

class NuevoDesafioModel extends FlutterFlowModel<NuevoDesafioWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
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
