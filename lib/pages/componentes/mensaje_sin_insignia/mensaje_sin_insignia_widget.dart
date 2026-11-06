import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'mensaje_sin_insignia_model.dart';
export 'mensaje_sin_insignia_model.dart';

class MensajeSinInsigniaWidget extends StatefulWidget {
  const MensajeSinInsigniaWidget({super.key});

  @override
  State<MensajeSinInsigniaWidget> createState() =>
      _MensajeSinInsigniaWidgetState();
}

class _MensajeSinInsigniaWidgetState extends State<MensajeSinInsigniaWidget> {
  late MensajeSinInsigniaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MensajeSinInsigniaModel());

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
              'Todavía no obtuviste insignias.\nCompletá misiones con insignia para comenzar tu colección.',
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
