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
      return 'completar campo';
    }

    if (val.length > 45) {
      return 'Maximum 45 characters allowed, currently ${val.length}.';
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
      return 'completar campo';
    }

    if (val.length < 10) {
      return 'mínimo 10 caracteres';
    }
    if (val.length > 120) {
      return 'Maximum 120 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for txtCondiciones widget.
  FocusNode? txtCondicionesFocusNode;
  TextEditingController? txtCondicionesTextController;
  String? Function(BuildContext, String?)?
      txtCondicionesTextControllerValidator;
  String? _txtCondicionesTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'completar campo';
    }

    if (val.length < 10) {
      return 'mínimo 10 caracteres';
    }

    return null;
  }

  // State field(s) for txtCostoPuntos widget.
  FocusNode? txtCostoPuntosFocusNode;
  TextEditingController? txtCostoPuntosTextController;
  String? Function(BuildContext, String?)?
      txtCostoPuntosTextControllerValidator;
  String? _txtCostoPuntosTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'completar campo';
    }

    if (val.length > 3) {
      return 'Maximum 3 characters allowed, currently ${val.length}.';
    }
    if (!RegExp('^[1-9][0-9]*\$').hasMatch(val)) {
      return 'Ingresá un número entero mayor que 0';
    }
    return null;
  }

  // State field(s) for ddTipo widget.
  String? ddTipoValue;
  FormFieldController<String>? ddTipoValueController;
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
    txtCondicionesTextControllerValidator =
        _txtCondicionesTextControllerValidator;
    txtCostoPuntosTextControllerValidator =
        _txtCostoPuntosTextControllerValidator;
  }

  @override
  void dispose() {
    txtNombreFocusNode?.dispose();
    txtNombreTextController?.dispose();

    txtDescripcionFocusNode?.dispose();
    txtDescripcionTextController?.dispose();

    txtCondicionesFocusNode?.dispose();
    txtCondicionesTextController?.dispose();

    txtCostoPuntosFocusNode?.dispose();
    txtCostoPuntosTextController?.dispose();

    txtPorcentajeFocusNode?.dispose();
    txtPorcentajeTextController?.dispose();

    txtStockFocusNode?.dispose();
    txtStockTextController?.dispose();
  }
}
