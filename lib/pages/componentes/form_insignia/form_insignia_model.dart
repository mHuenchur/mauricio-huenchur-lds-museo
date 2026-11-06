import '/flutter_flow/flutter_flow_util.dart';
import 'form_insignia_widget.dart' show FormInsigniaWidget;
import 'package:flutter/material.dart';

class FormInsigniaModel extends FlutterFlowModel<FormInsigniaWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading_uploadDataTl7 = false;
  FFUploadedFile uploadedLocalFile_uploadDataTl7 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataTl7 = '';

  // State field(s) for txtNombreInsignia widget.
  FocusNode? txtNombreInsigniaFocusNode;
  TextEditingController? txtNombreInsigniaTextController;
  String? Function(BuildContext, String?)?
      txtNombreInsigniaTextControllerValidator;
  String? _txtNombreInsigniaTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Falta Nombre de la insignia';
    }

    return null;
  }

  // State field(s) for txtDescripcionInsignia widget.
  FocusNode? txtDescripcionInsigniaFocusNode;
  TextEditingController? txtDescripcionInsigniaTextController;
  String? Function(BuildContext, String?)?
      txtDescripcionInsigniaTextControllerValidator;
  String? _txtDescripcionInsigniaTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Falta Descripción de la insignia';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    txtNombreInsigniaTextControllerValidator =
        _txtNombreInsigniaTextControllerValidator;
    txtDescripcionInsigniaTextControllerValidator =
        _txtDescripcionInsigniaTextControllerValidator;
  }

  @override
  void dispose() {
    txtNombreInsigniaFocusNode?.dispose();
    txtNombreInsigniaTextController?.dispose();

    txtDescripcionInsigniaFocusNode?.dispose();
    txtDescripcionInsigniaTextController?.dispose();
  }
}
