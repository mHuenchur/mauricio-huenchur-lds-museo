import '/flutter_flow/flutter_flow_util.dart';
import 'nueva_sala_widget.dart' show NuevaSalaWidget;
import 'package:flutter/material.dart';

class NuevaSalaModel extends FlutterFlowModel<NuevaSalaWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingrese un nombre para la sala.';
    }

    if (val.length < 5) {
      return 'mínimo 5 caracteres';
    }
    if (val.length > 45) {
      return 'máximo 45 caracteres';
    }
    if (!RegExp('\\S').hasMatch(val)) {
      return 'Ingrese un nombre para la sala.';
    }
    return null;
  }

  // Stores action output result for [Validate Form] action in IconButton widget.
  bool? formSalaCompleto;

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
