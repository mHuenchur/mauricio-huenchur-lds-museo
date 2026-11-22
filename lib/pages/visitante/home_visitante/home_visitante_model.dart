import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componentes/menu_visitante/menu_visitante_widget.dart';
import '/index.dart';
import 'home_visitante_widget.dart' show HomeVisitanteWidget;
import 'package:flutter/material.dart';

class HomeVisitanteModel extends FlutterFlowModel<HomeVisitanteWidget> {
  ///  Local state fields for this page.

  DocumentReference? salaFiltroRef;

  ///  State fields for stateful widgets in this page.

  // Model for menuVisitante component.
  late MenuVisitanteModel menuVisitanteModel;

  @override
  void initState(BuildContext context) {
    menuVisitanteModel = createModel(context, () => MenuVisitanteModel());
  }

  @override
  void dispose() {
    menuVisitanteModel.dispose();
  }
}
