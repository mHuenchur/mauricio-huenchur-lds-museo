import '/components/logo_app_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'login_page_widget.dart' show LoginPageWidget;
import 'package:flutter/material.dart';

class LoginPageModel extends FlutterFlowModel<LoginPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for logo_app component.
  late LogoAppModel logoAppModel;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  String? _emailAddressTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Completar campo';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Email invalido!';
    }
    return null;
  }

  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  String? _passwordTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Completar campo';
    }

    if (val.length < 6) {
      return 'Minimo 6 caracteres';
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? isLoginValidated;

  @override
  void initState(BuildContext context) {
    logoAppModel = createModel(context, () => LogoAppModel());
    emailAddressTextControllerValidator = _emailAddressTextControllerValidator;
    passwordVisibility = false;
    passwordTextControllerValidator = _passwordTextControllerValidator;
  }

  @override
  void dispose() {
    logoAppModel.dispose();
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}
