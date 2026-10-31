import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componentes/switch_mision/switch_mision_widget.dart';
import '/index.dart';
import 'home_administrador_widget.dart' show HomeAdministradorWidget;
import 'package:flutter/material.dart';

class HomeAdministradorModel extends FlutterFlowModel<HomeAdministradorWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for SwitchMision dynamic component.
  late FlutterFlowDynamicModels<SwitchMisionModel> switchMisionModels1;
  // Models for SwitchMision dynamic component.
  late FlutterFlowDynamicModels<SwitchMisionModel> switchMisionModels2;

  @override
  void initState(BuildContext context) {
    switchMisionModels1 = FlutterFlowDynamicModels(() => SwitchMisionModel());
    switchMisionModels2 = FlutterFlowDynamicModels(() => SwitchMisionModel());
  }

  @override
  void dispose() {
    switchMisionModels1.dispose();
    switchMisionModels2.dispose();
  }
}
