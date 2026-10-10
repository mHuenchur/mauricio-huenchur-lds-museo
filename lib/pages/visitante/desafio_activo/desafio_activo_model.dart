import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'desafio_activo_widget.dart' show DesafioActivoWidget;
import 'package:flutter/material.dart';

class DesafioActivoModel extends FlutterFlowModel<DesafioActivoWidget> {
  ///  Local state fields for this page.

  bool mostrarPistaExtra = false;

  ///  State fields for stateful widgets in this page.

  var codigoLeido = '';
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  DesafiosRecord? numeroDesafioSiguiente;
  bool isDataUploading_uploadDataUq5 = false;
  FFUploadedFile uploadedLocalFile_uploadDataUq5 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataUq5 = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
