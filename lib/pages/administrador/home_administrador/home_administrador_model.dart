import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componentes/menu_administrador/menu_administrador_widget.dart';
import '/pages/componentes/switch_mision/switch_mision_widget.dart';
import '/index.dart';
import 'home_administrador_widget.dart' show HomeAdministradorWidget;
import 'package:flutter/material.dart';

class HomeAdministradorModel extends FlutterFlowModel<HomeAdministradorWidget> {
  ///  Local state fields for this page.

  DocumentReference? salaFiltroRef;

  ///  State fields for stateful widgets in this page.

  // Model for MenuAdministrador component.
  late MenuAdministradorModel menuAdministradorModel1;
  // Models for SwitchMision dynamic component.
  late FlutterFlowDynamicModels<SwitchMisionModel> switchMisionModels;
  // Model for MenuAdministrador component.
  late MenuAdministradorModel menuAdministradorModel2;

  @override
  void initState(BuildContext context) {
    menuAdministradorModel1 =
        createModel(context, () => MenuAdministradorModel());
    switchMisionModels = FlutterFlowDynamicModels(() => SwitchMisionModel());
    menuAdministradorModel2 =
        createModel(context, () => MenuAdministradorModel());
  }

  @override
  void dispose() {
    menuAdministradorModel1.dispose();
    switchMisionModels.dispose();
    menuAdministradorModel2.dispose();
  }
}
