import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Validar cupón',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.outfit(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: (FFMainAxisAlignment.center).flutterValue,
                crossAxisAlignment: (FFCrossAxisAlignment.center).flutterValue,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    'Escaneá el cupón del visitante o ingresá su código.',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          font: GoogleFonts.outfit(
                            fontWeight: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .fontStyle,
                        ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                    child: FFButtonWidget(
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
                                  final result = await FirebaseFunctions
                                      .instance
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
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        content: Text(_model.resultadoConsulta
                                                    ?.errorCode ==
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
                                                        : 'No se pudo consultar el cupón. Intentá nuevamente.')))),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              }

                              safeSetState(() {});
                            },
                      text: 'Escanear QR',
                      options: FFButtonOptions(
                        width: 500.0,
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
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
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                    child: Container(
                      width: 420.0,
                      height: 150.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).secondary,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment:
                            (FFMainAxisAlignment.center).flutterValue,
                        children: [
                          Container(
                            width: 300.0,
                            child: TextFormField(
                              controller: _model.txtCodigoCuponTextController,
                              focusNode: _model.txtCodigoCuponFocusNode,
                              autofocus: false,
                              enabled: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelText: 'Codigo cupón',
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      font: GoogleFonts.outfit(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontStyle,
                                    ),
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      font: GoogleFonts.outfit(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontStyle,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    font: GoogleFonts.outfit(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontStyle,
                                  ),
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              enableInteractiveSelection: true,
                              validator: _model
                                  .txtCodigoCuponTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: (_model.procesandoEntrega == true)
                                  ? null
                                  : () async {
                                      if (_model.txtCodigoCuponTextController
                                                  .text !=
                                              '') {
                                        _model.codigoCupon = _model
                                            .txtCodigoCuponTextController.text;
                                        safeSetState(() {});
                                        _model.mostrarCupon = false;
                                        _model.consultandoCupon = true;
                                        safeSetState(() {});
                                        try {
                                          final result = await FirebaseFunctions
                                              .instance
                                              .httpsCallable('consultarCupon')
                                              .call({
                                            "canjeId": _model.codigoCupon!,
                                          });
                                          _model.resultadoConsulta =
                                              ConsultarCuponCloudFunctionCallResponse(
                                            data: DatosCuponStruct.fromMap(
                                                result.data),
                                            succeeded: true,
                                            resultAsString:
                                                result.data.toString(),
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
                                        if (_model
                                            .resultadoConsulta!.succeeded!) {
                                          _model.cuponConsultado =
                                              _model.resultadoConsulta?.data;
                                          _model.mostrarCupon = true;
                                          safeSetState(() {});
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                content: Text(_model
                                                            .resultadoConsulta
                                                            ?.errorCode ==
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
                                                                : 'No se pudo consultar el cupón. Intentá nuevamente.')))),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              content: Text(
                                                  'Ingresá el código del cupón.'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Ok'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      }

                                      safeSetState(() {});
                                    },
                              text: 'Consultar cupón',
                              options: FFButtonOptions(
                                width: 300.0,
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
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (_model.mostrarCupon)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                      child: Container(
                        width: 500.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).secondary,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment:
                              (FFMainAxisAlignment.spaceEvenly).flutterValue,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  _model.cuponConsultado?.nombre,
                                  'NOMBRE',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.outfit(
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
                            ),
                            Text(
                              valueOrDefault<String>(
                                _model.cuponConsultado?.condiciones,
                                'CONDICIONES',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.outfit(
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
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: Text(
                                _model.cuponConsultado?.estado == 'pendiente'
                                    ? 'Pendiente de uso'
                                    : (_model.cuponConsultado?.estado ==
                                            'utilizado'
                                        ? 'Este cupón ya fue utilizado'
                                        : 'Cupón no disponible'),
                                style: FlutterFlowTheme.of(context)
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
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            if (_model.cuponConsultado?.estado == 'pendiente')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 10.0),
                                child: FFButtonWidget(
                                  onPressed: ((_model.procesandoEntrega ==
                                              true) ||
                                          (_model.consultandoCupon == true))
                                      ? null
                                      : () async {
                                          if ((_model.procesandoEntrega ==
                                                  false) &&
                                              (_model.consultandoCupon ==
                                                  false)) {
                                            _model.procesandoEntrega = true;
                                            safeSetState(() {});
                                            var confirmDialogResponse =
                                                await showDialog<bool>(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
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
                                                              child: Text(
                                                                  'Cancelar'),
                                                            ),
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      true),
                                                              child: Text(
                                                                  'Confirmar'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ) ??
                                                    false;
                                            if (confirmDialogResponse) {
                                              try {
                                                final result =
                                                    await FirebaseFunctions
                                                        .instance
                                                        .httpsCallable(
                                                            'utilizarCupon')
                                                        .call({
                                                  "canjeId": _model
                                                      .cuponConsultado!.canjeId,
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

                                              if (_model
                                                  .resultadoUso!.succeeded!) {
                                                if (_model.resultadoUso
                                                        ?.resultAsString ==
                                                    'UTILIZADO') {
                                                  _model.mostrarCupon = false;
                                                  _model.procesandoEntrega =
                                                      false;
                                                  safeSetState(() {});
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        content: Text(
                                                            'Uso registrado correctamente.Entregá el objeto o aplicá el descuento indicado.'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: Text('Ok'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                  safeSetState(() {
                                                    _model
                                                        .txtCodigoCuponTextController
                                                        ?.clear();
                                                  });
                                                } else {
                                                  if (_model.resultadoUso
                                                          ?.resultAsString ==
                                                      'YA_UTILIZADO') {
                                                    _model.mostrarCupon = false;
                                                    _model.procesandoEntrega =
                                                        false;
                                                    safeSetState(() {});
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          content: Text(
                                                              'Este cupón ya tiene un uso registrado.No corresponde una nueva entrega.'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  } else {
                                                    _model.procesandoEntrega =
                                                        false;
                                                    safeSetState(() {});
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          content: Text(
                                                              'Vuelve a consultar el cupón.'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  }
                                                }
                                              } else {
                                                _model.procesandoEntrega =
                                                    false;
                                                _model.mostrarCupon = false;
                                                safeSetState(() {});
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      content: Text(_model
                                                                  .resultadoUso
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
                                                                      : 'No se pudo confirmar el resultado. Consultá nuevamente el cupón antes de entregar el beneficio.')))),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext),
                                                          child: Text('Ok'),
                                                        ),
                                                      ],
                                                    );
                                                  },
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
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                          ].divide(SizedBox(height: 4.0)),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
