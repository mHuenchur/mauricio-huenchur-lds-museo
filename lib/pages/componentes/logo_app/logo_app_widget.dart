import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'logo_app_model.dart';
export 'logo_app_model.dart';

class LogoAppWidget extends StatefulWidget {
  const LogoAppWidget({super.key});

  @override
  State<LogoAppWidget> createState() => _LogoAppWidgetState();
}

class _LogoAppWidgetState extends State<LogoAppWidget> {
  late LogoAppModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LogoAppModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 70.0, 0.0, 32.0),
      child: Container(
        width: 300.0,
        height: 70.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
        ),
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
                child: Icon(
                  Icons.museum_outlined,
                  color: Colors.white,
                  size: 56.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
              child: Text(
                'APP MUSEO',
                style: FlutterFlowTheme.of(context).displaySmall.override(
                      font: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.w600,
                        fontStyle:
                            FlutterFlowTheme.of(context).displaySmall.fontStyle,
                      ),
                      color: Colors.white,
                      fontSize: 36.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                      fontStyle:
                          FlutterFlowTheme.of(context).displaySmall.fontStyle,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
