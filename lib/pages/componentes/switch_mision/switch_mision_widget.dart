import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'switch_mision_model.dart';
export 'switch_mision_model.dart';

class SwitchMisionWidget extends StatefulWidget {
  const SwitchMisionWidget({
    super.key,
    required this.misionRef,
    required this.activaInicial,
  });

  final DocumentReference? misionRef;
  final bool? activaInicial;

  @override
  State<SwitchMisionWidget> createState() => _SwitchMisionWidgetState();
}

class _SwitchMisionWidgetState extends State<SwitchMisionWidget> {
  late SwitchMisionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SwitchMisionModel());

    _model.switchValue = widget.activaInicial!;
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(
      value: _model.switchValue!,
      onChanged: (newValue) async {
        safeSetState(() => _model.switchValue = newValue);
        if (newValue) {
          await widget.misionRef!.update(createMisionesRecordData(
            estaActiva: true,
          ));
        } else {
          await widget.misionRef!.update(createMisionesRecordData(
            estaActiva: false,
          ));
        }
      },
      activeColor: FlutterFlowTheme.of(context).success,
      activeTrackColor: FlutterFlowTheme.of(context).accent1,
      inactiveTrackColor: FlutterFlowTheme.of(context).accent1,
      inactiveThumbColor: FlutterFlowTheme.of(context).secondaryBackground,
    );
  }
}
