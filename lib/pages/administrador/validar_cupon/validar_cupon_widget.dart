import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'validar_cupon_model.dart';
export 'validar_cupon_model.dart';

class ValidarCuponWidget extends StatefulWidget {
  const ValidarCuponWidget({super.key});

  static String routeName = 'validar_cupon';
  static String routePath = '/validarCupon';

  @override
  State<ValidarCuponWidget> createState() => _ValidarCuponWidgetState();
}

class _ValidarCuponWidgetState extends State<ValidarCuponWidget> {
  late ValidarCuponModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ValidarCuponModel());

    _model.txtCodigoCuponTextController ??= TextEditingController();
    _model.txtCodigoCuponFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: (FFMainAxisAlignment.start).flutterValue,
              crossAxisAlignment: (FFCrossAxisAlignment.center).flutterValue,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  'Hello World',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.roboto(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
                FFButtonWidget(
                  onPressed: (_model.procesandoEntrega == true)
                      ? null
                      : () async {
                          _model.codigoEscaneado =
                              await FlutterBarcodeScanner.scanBarcode(
                            '#C62828', // scanning line color
                            'Cancel', // cancel button text
                            true, // whether to show the torch (camera LED) toggle icon
                            ScanMode.QR,
                          );

                          if (_model.codigoEscaneado != '') {
                            _model.codigoCupon = _model.codigoEscaneado;
                            safeSetState(() {});
                            _model.mostrarCupon = false;
                            _model.consultandoCupon = true;
                            safeSetState(() {});
                            try {
                              final result = await FirebaseFunctions.instance
                                  .httpsCallable('consultarCupon')
                                  .call({
                                "canjeId": _model.codigoCupon!,
                              });
                              _model.resultadoConsultaQR =
                                  ConsultarCuponCloudFunctionCallResponse(
                                data: DatosCuponStruct.fromMap(result.data),
                                succeeded: true,
                                resultAsString: result.data.toString(),
                                jsonBody: result.data,
                              );
                            } on FirebaseFunctionsException catch (error) {
                              _model.resultadoConsultaQR =
                                  ConsultarCuponCloudFunctionCallResponse(
                                errorCode: error.code,
                                succeeded: false,
                              );
                            }

                            _model.consultandoCupon = false;
                            safeSetState(() {});
                            if (_model.resultadoConsultaQR!.succeeded!) {
                              _model.cuponConsultado =
                                  _model.resultadoConsultaQR?.data;
                              _model.mostrarCupon = true;
                              safeSetState(() {});
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    _model.resultadoConsulta?.errorCode ==
                                            'permission-denied'
                                        ? 'Tu cuenta no tiene permiso para validar cupones.'
                                        : (_model.resultadoConsulta
                                                    ?.errorCode ==
                                                'not-found'
                                            ? 'No se encontró el cupón.'
                                            : (_model.resultadoConsulta
                                                        ?.errorCode ==
                                                    'invalid-argument'
                                                ? 'El código ingresado no es válido.'
                                                : (_model.resultadoConsulta
                                                            ?.errorCode ==
                                                        'unauthenticated'
                                                    ? 'Iniciá sesión nuevamente.'
                                                    : 'No se pudo consultar el cupón. Intentá nuevamente.'))),
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                            }
                          }

                          safeSetState(() {});
                        },
                  text: 'Escanear QR',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.outfit(
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          color: Colors.white,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                if (_model.codigoCupon != null && _model.codigoCupon != '')
                  Text(
                    valueOrDefault<String>(
                      _model.codigoCupon,
                      'CODIGO CUPON',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.roboto(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                Container(
                  width: 200.0,
                  child: TextFormField(
                    controller: _model.txtCodigoCuponTextController,
                    focusNode: _model.txtCodigoCuponFocusNode,
                    autofocus: false,
                    enabled: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      isDense: true,
                      labelStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                font: GoogleFonts.roboto(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontStyle,
                              ),
                      hintText: 'TextField',
                      hintStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                font: GoogleFonts.roboto(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontStyle,
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.roboto(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                    enableInteractiveSelection: true,
                    validator: _model.txtCodigoCuponTextControllerValidator
                        .asValidator(context),
                  ),
                ),
                FFButtonWidget(
                  onPressed: (_model.procesandoEntrega == true)
                      ? null
                      : () async {
                          if (_model.txtCodigoCuponTextController.text != '') {
                            _model.codigoCupon =
                                _model.txtCodigoCuponTextController.text;
                            safeSetState(() {});
                            _model.mostrarCupon = false;
                            _model.consultandoCupon = true;
                            safeSetState(() {});
                            try {
                              final result = await FirebaseFunctions.instance
                                  .httpsCallable('consultarCupon')
                                  .call({
                                "canjeId": _model.codigoCupon!,
                              });
                              _model.resultadoConsulta =
                                  ConsultarCuponCloudFunctionCallResponse(
                                data: DatosCuponStruct.fromMap(result.data),
                                succeeded: true,
                                resultAsString: result.data.toString(),
                                jsonBody: result.data,
                              );
                            } on FirebaseFunctionsException catch (error) {
                              _model.resultadoConsulta =
                                  ConsultarCuponCloudFunctionCallResponse(
                                errorCode: error.code,
                                succeeded: false,
                              );
                            }

                            _model.consultandoCupon = false;
                            safeSetState(() {});
                            if (_model.resultadoConsulta!.succeeded!) {
                              _model.cuponConsultado =
                                  _model.resultadoConsulta?.data;
                              _model.mostrarCupon = true;
                              safeSetState(() {});
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    _model.resultadoConsulta?.errorCode ==
                                            'permission-denied'
                                        ? 'Tu cuenta no tiene permiso para validar cupones.'
                                        : (_model.resultadoConsulta
                                                    ?.errorCode ==
                                                'not-found'
                                            ? 'No se encontró el cupón.'
                                            : (_model.resultadoConsulta
                                                        ?.errorCode ==
                                                    'invalid-argument'
                                                ? 'El código ingresado no es válido.'
                                                : (_model.resultadoConsulta
                                                            ?.errorCode ==
                                                        'unauthenticated'
                                                    ? 'Iniciá sesión nuevamente.'
                                                    : 'No se pudo consultar el cupón. Intentá nuevamente.'))),
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Ingresá el código del cupón.',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                          }

                          safeSetState(() {});
                        },
                  text: 'Consultar cupón',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.outfit(
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          color: Colors.white,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                if (_model.mostrarCupon)
                  Container(
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            _model.cuponConsultado?.nombre,
                            'NOMBRE',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.roboto(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                        Text(
                          valueOrDefault<String>(
                            _model.cuponConsultado?.condiciones,
                            'CONDICIONES',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.roboto(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                        Text(
                          _model.cuponConsultado?.estado == 'pendiente'
                              ? 'Pendiente de uso'
                              : (_model.cuponConsultado?.estado == 'utilizado'
                                  ? 'Este cupón ya fue utilizado'
                                  : 'Cupón no disponible'),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.roboto(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                        if (_model.cuponConsultado?.estado == 'pendiente')
                          FFButtonWidget(
                            onPressed: ((_model.procesandoEntrega == true) ||
                                    (_model.consultandoCupon == true))
                                ? null
                                : () async {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'procesandoEntrega: ${_model.procesandoEntrega.toString()}consultandoCupon: ${_model.consultandoCupon?.toString()}',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                    if ((_model.procesandoEntrega == false) &&
                                        (_model.consultandoCupon == false)) {
                                      _model.procesandoEntrega = true;
                                      safeSetState(() {});
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'entro',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                        ),
                                      );
                                      var confirmDialogResponse =
                                          await showDialog<bool>(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text(
                                                        'Confirmar uso del cupón'),
                                                    content: Text(
                                                        'Se registrará el uso de este cupón para entregar el beneficio indicado. No podrá utilizarse nuevamente. ¿Confirmás?'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext,
                                                                false),
                                                        child: Text('Cancelar'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext,
                                                                true),
                                                        child:
                                                            Text('Confirmar'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ) ??
                                              false;
                                      if (confirmDialogResponse) {
                                        try {
                                          final result = await FirebaseFunctions
                                              .instance
                                              .httpsCallable('utilizarCupon')
                                              .call({
                                            "canjeId":
                                                _model.cuponConsultado!.canjeId,
                                          });
                                          _model.resultadoUso =
                                              UtilizarCuponCloudFunctionCallResponse(
                                            data: result.data,
                                            succeeded: true,
                                            resultAsString:
                                                result.data.toString(),
                                            jsonBody: result.data,
                                          );
                                        } on FirebaseFunctionsException catch (error) {
                                          _model.resultadoUso =
                                              UtilizarCuponCloudFunctionCallResponse(
                                            errorCode: error.code,
                                            succeeded: false,
                                          );
                                        }

                                        if (_model.resultadoUso!.succeeded!) {
                                          if (_model.resultadoUso
                                                  ?.resultAsString ==
                                              'UTILIZADO') {
                                            _model.mostrarCupon = false;
                                            _model.procesandoEntrega = false;
                                            safeSetState(() {});
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Uso registrado correctamente.Entregá el objeto o aplicá el descuento indicado.',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            );
                                          } else {
                                            if (_model.resultadoUso
                                                    ?.resultAsString ==
                                                'YA_UTILIZADO') {
                                              _model.mostrarCupon = false;
                                              _model.procesandoEntrega = false;
                                              safeSetState(() {});
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Este cupón ya tiene un uso registrado.No corresponde una nueva entrega.',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                              );
                                            } else {
                                              _model.procesandoEntrega = false;
                                              safeSetState(() {});
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Vuelve a consultar el cupón.',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                              );
                                            }
                                          }
                                        } else {
                                          _model.procesandoEntrega = false;
                                          _model.mostrarCupon = false;
                                          safeSetState(() {});
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                _model.resultadoUso
                                                            ?.errorCode ==
                                                        'permission-denied'
                                                    ? 'Tu cuenta no tiene permiso para confirmar entregas.'
                                                    : (_model.resultadoUso
                                                                ?.errorCode ==
                                                            'not-found'
                                                        ? 'El cupón no existe.'
                                                        : (_model.resultadoUso
                                                                    ?.errorCode ==
                                                                'failed-precondition'
                                                            ? 'El cupón no está disponible para utilizar.'
                                                            : (_model.resultadoUso
                                                                        ?.errorCode ==
                                                                    'unauthenticated'
                                                                ? 'Iniciá sesión nuevamente.'
                                                                : 'No se pudo confirmar el resultado. Consultá nuevamente el cupón antes de entregar el beneficio.'))),
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          );
                                        }
                                      } else {
                                        _model.procesandoEntrega = false;
                                        safeSetState(() {});
                                      }
                                    }

                                    safeSetState(() {});
                                  },
                            text: 'Confirmar entrega',
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.outfit(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
