import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'nuevo_desafio_widget.dart' show NuevoDesafioWidget;
import 'package:flutter/material.dart';

class NuevoDesafioModel extends FlutterFlowModel<NuevoDesafioWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo vacio';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo vacio';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  String? _textController3Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo vacio';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  String? _textController4Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo vacio';
    }

    return null;
  }

  // State field(s) for campoPuntos widget.
  FocusNode? campoPuntosFocusNode;
  TextEditingController? campoPuntosTextController;
  String? Function(BuildContext, String?)? campoPuntosTextControllerValidator;
  String? _campoPuntosTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo vacio';
    }

    return null;
  }

  // State field(s) for DropDownValidacion widget.
  String? dropDownValidacionValue;
  FormFieldController<String>? dropDownValidacionValueController;
  bool isDataUploading_uploadDataVlf = false;
  FFUploadedFile uploadedLocalFile_uploadDataVlf =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataVlf = '';

  // Stores action output result for [Validate Form] action in Button widget.
  bool? formDesafioCompleto;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  DesafiosRecord? nuevoDesafioCreado;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  DesafiosRecord? nuevoDesafioCreadoIA;

  @override
  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
    textController2Validator = _textController2Validator;
    textController3Validator = _textController3Validator;
    textController4Validator = _textController4Validator;
    campoPuntosTextControllerValidator = _campoPuntosTextControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    campoPuntosFocusNode?.dispose();
    campoPuntosTextController?.dispose();
  }
}
