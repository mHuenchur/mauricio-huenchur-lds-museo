import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'nueva_mision_widget.dart' show NuevaMisionWidget;
import 'package:flutter/material.dart';

class NuevaMisionModel extends FlutterFlowModel<NuevaMisionWidget> {
  ///  Local state fields for this component.

  DocumentReference? insigniaSeleccionadaRef;

  DocumentReference? misionRequeridaSeleccionadaRef;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingrese un nombre para la misión.';
    }

    if (val.length < 5) {
      return 'El nombre debe tener al menos 5 caracteres.';
    }
    if (val.length > 45) {
      return 'El nombre puede tener hasta 45 caracteres.';
    }
    if (!RegExp('\\S').hasMatch(val)) {
      return 'completar campo';
    }
    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingrese una descripción para la misión.';
    }

    if (val.length < 10) {
      return 'La descripción debe tener al menos 10 caracteres.';
    }
    if (val.length > 120) {
      return 'La descripción puede tener hasta 120 caracteres.';
    }
    if (!RegExp('\\S').hasMatch(val)) {
      return 'completar campo';
    }
    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  List<SalasRecord>? salaReferencia;
  bool isDataUploading_uploadDataE0t = false;
  FFUploadedFile uploadedLocalFile_uploadDataE0t =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataE0t = '';

  // Stores action output result for [Validate Form] action in Button widget.
  bool? datosCompletos;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<MisionesRecord>? misionesConInsignia;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  InsigniasRecord? documentoLeido;

  @override
  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
    textController2Validator = _textController2Validator;
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
