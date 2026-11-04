import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'mensaje_sin_misiones_model.dart';
export 'mensaje_sin_misiones_model.dart';

class MensajeSinMisionesWidget extends StatefulWidget {
  const MensajeSinMisionesWidget({super.key});

  @override
  State<MensajeSinMisionesWidget> createState() =>
      _MensajeSinMisionesWidgetState();
}

class _MensajeSinMisionesWidgetState extends State<MensajeSinMisionesWidget> {
  late MensajeSinMisionesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MensajeSinMisionesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.circular(6.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).tertiary,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15.0, 8.0, 15.0, 8.0),
            child: Text(
              'Todavía no completaste ninguna misión.',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).titleMedium.override(
                    font: GoogleFonts.outfit(
                      fontWeight:
                          FlutterFlowTheme.of(context).titleMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleMedium.fontStyle,
                    ),
                    fontSize: 20.0,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).titleMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleMedium.fontStyle,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
