import '/flutter_flow/flutter_flow_util.dart';
import 'editar_perfil_widget.dart' show EditarPerfilWidget;
import 'package:flutter/material.dart';

class EditarPerfilModel extends FlutterFlowModel<EditarPerfilWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading_uploadDataClr = false;
  FFUploadedFile uploadedLocalFile_uploadDataClr =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataClr = '';

  // State field(s) for nombrePerfil widget.
  FocusNode? nombrePerfilFocusNode;
  TextEditingController? nombrePerfilTextController;
  String? Function(BuildContext, String?)? nombrePerfilTextControllerValidator;
  String? _nombrePerfilTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingresá tu nombre';
    }

    if (val.length < 3) {
      return 'Minimo 3 caracteres';
    }
    if (val.length > 25) {
      return 'Maximo 25 caracteres';
    }
    if (!RegExp('\\S').hasMatch(val)) {
      return 'Ingresá tu nombre';
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    nombrePerfilTextControllerValidator = _nombrePerfilTextControllerValidator;
  }

  @override
  void dispose() {
    nombrePerfilFocusNode?.dispose();
    nombrePerfilTextController?.dispose();
  }
}
