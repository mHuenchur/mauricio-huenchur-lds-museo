import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'crear_recompensa_widget.dart' show CrearRecompensaWidget;
import 'package:flutter/material.dart';

class CrearRecompensaModel extends FlutterFlowModel<CrearRecompensaWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for txtNombre widget.
  FocusNode? txtNombreFocusNode;
  TextEditingController? txtNombreTextController;
  String? Function(BuildContext, String?)? txtNombreTextControllerValidator;
  String? _txtNombreTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Hello World is required';
    }

    return null;
  }

  // State field(s) for txtDescripcion widget.
  FocusNode? txtDescripcionFocusNode;
  TextEditingController? txtDescripcionTextController;
  String? Function(BuildContext, String?)?
      txtDescripcionTextControllerValidator;
  String? _txtDescripcionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Hello World is required';
    }

    return null;
  }

  // State field(s) for ddTipo widget.
  String? ddTipoValue;
  FormFieldController<String>? ddTipoValueController;
  // State field(s) for txtCostoPuntos widget.
  FocusNode? txtCostoPuntosFocusNode;
  TextEditingController? txtCostoPuntosTextController;
  String? Function(BuildContext, String?)?
      txtCostoPuntosTextControllerValidator;
  String? _txtCostoPuntosTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Hello World is required';
    }

    if (!RegExp('^[1-9][0-9]*\$').hasMatch(val)) {
      return 'Ingresá un número entero mayor que 0';
    }
    return null;
  }

  // State field(s) for txtCondiciones widget.
  FocusNode? txtCondicionesFocusNode;
  TextEditingController? txtCondicionesTextController;
  String? Function(BuildContext, String?)?
      txtCondicionesTextControllerValidator;
  // State field(s) for txtPorcentaje widget.
  FocusNode? txtPorcentajeFocusNode;
  TextEditingController? txtPorcentajeTextController;
  String? Function(BuildContext, String?)? txtPorcentajeTextControllerValidator;
  // State field(s) for swStockLimitado widget.
  bool? swStockLimitadoValue;
  // State field(s) for txtStock widget.
  FocusNode? txtStockFocusNode;
  TextEditingController? txtStockTextController;
  String? Function(BuildContext, String?)? txtStockTextControllerValidator;
  bool isDataUploading_uploadDataAlm = false;
  FFUploadedFile uploadedLocalFile_uploadDataAlm =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataAlm = '';

  // Stores action output result for [Validate Form] action in btnGuardar widget.
  bool? formRecompensaValido;

  @override
  void initState(BuildContext context) {
    txtNombreTextControllerValidator = _txtNombreTextControllerValidator;
    txtDescripcionTextControllerValidator =
        _txtDescripcionTextControllerValidator;
    txtCostoPuntosTextControllerValidator =
        _txtCostoPuntosTextControllerValidator;
  }

  @override
  void dispose() {
    txtNombreFocusNode?.dispose();
    txtNombreTextController?.dispose();

    txtDescripcionFocusNode?.dispose();
    txtDescripcionTextController?.dispose();

    txtCostoPuntosFocusNode?.dispose();
    txtCostoPuntosTextController?.dispose();

    txtCondicionesFocusNode?.dispose();
    txtCondicionesTextController?.dispose();

    txtPorcentajeFocusNode?.dispose();
    txtPorcentajeTextController?.dispose();

    txtStockFocusNode?.dispose();
    txtStockTextController?.dispose();
  }
}
