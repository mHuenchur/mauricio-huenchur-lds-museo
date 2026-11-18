import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'recompensas_visitante_model.dart';
export 'recompensas_visitante_model.dart';

class RecompensasVisitanteWidget extends StatefulWidget {
  const RecompensasVisitanteWidget({super.key});

  static String routeName = 'recompensas_visitante';
  static String routePath = '/recompensasVisitante';

  @override
  State<RecompensasVisitanteWidget> createState() =>
      _RecompensasVisitanteWidgetState();
}

class _RecompensasVisitanteWidgetState
    extends State<RecompensasVisitanteWidget> {
  late RecompensasVisitanteModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecompensasVisitanteModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 230.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset(
                    'assets/images/Llave_dorada_y_regalo_de_museo.png',
                  ).image,
                ),
              ),
              child: Container(
                width: 100.0,
                height: 170.0,
                decoration: BoxDecoration(),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 64.0, 16.0, 12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                        child: Text(
                          'Recompensas',
                          style: FlutterFlowTheme.of(context)
                              .displaySmall
                              .override(
                                font: GoogleFonts.outfit(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .displaySmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .displaySmall
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .displaySmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .displaySmall
                                    .fontStyle,
                              ),
                        ),
                      ),
                      Text(
                        'Tus puntos disponibles',
                        style: FlutterFlowTheme.of(context)
                            .labelMedium
                            .override(
                              font: GoogleFonts.roboto(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .fontStyle,
                            ),
                      ),
                      AuthUserStreamWidget(
                        builder: (context) => Text(
                          '${valueOrDefault<String>(
                            valueOrDefault(
                                    currentUserDocument?.puntosDisponibles, 0)
                                .toString(),
                            '0',
                          )} puntos',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                font: GoogleFonts.roboto(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).tertiary,
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
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            context.pushNamed(MisRecompensasWidget.routeName);
                          },
                          text: 'Ver mis cupones',
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 0.0, 0.0),
              child: Text(
                'Elegí tu recompensa',
                style: FlutterFlowTheme.of(context).labelLarge.override(
                      font: GoogleFonts.roboto(
                        fontWeight:
                            FlutterFlowTheme.of(context).labelLarge.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelLarge.fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).labelLarge.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelLarge.fontStyle,
                    ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: StreamBuilder<List<RecompensasRecord>>(
                        stream: queryRecompensasRecord(
                          queryBuilder: (recompensasRecord) =>
                              recompensasRecord.where(
                            'archivada',
                            isEqualTo: false,
                          ),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<RecompensasRecord>
                              listViewRecompensasRecordList = snapshot.data!;

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewRecompensasRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewRecompensasRecord =
                                  listViewRecompensasRecordList[listViewIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 8.0, 16.0, 8.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 3.0,
                                        color: Color(0x411D2429),
                                        offset: Offset(
                                          0.0,
                                          1.0,
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 1.0, 1.0, 1.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(6.0),
                                              child: Image.network(
                                                listViewRecompensasRecord
                                                    .imagen,
                                                height: 150.0,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 8.0, 0.0, 0.0),
                                            child: Text(
                                              listViewRecompensasRecord.nombre,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .headlineSmall
                                                  .override(
                                                    font: GoogleFonts.outfit(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineSmall
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineSmall
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 8.0, 0.0, 0.0),
                                          child: Text(
                                            listViewRecompensasRecord
                                                .descripcion,
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge
                                                .override(
                                                  font: GoogleFonts.outfit(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLarge
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLarge
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLarge
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLarge
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 4.0, 8.0, 0.0),
                                          child: AutoSizeText(
                                            listViewRecompensasRecord
                                                .condiciones
                                                .maybeHandleOverflow(
                                              maxChars: 70,
                                              replacement: '…',
                                            ),
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  font: GoogleFonts.roboto(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 8.0, 4.0, 8.0),
                                          child: Text(
                                            'Costo: ${listViewRecompensasRecord.costoPuntos.toString()} puntos',
                                            textAlign: TextAlign.end,
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge
                                                .override(
                                                  font: GoogleFonts.outfit(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLarge
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLarge
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLarge
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLarge
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 4.0, 8.0, 0.0),
                                          child: AutoSizeText(
                                            listViewRecompensasRecord
                                                        .stockLimitado ==
                                                    true
                                                ? (listViewRecompensasRecord
                                                            .stockDisponible >
                                                        0
                                                    ? 'Disponibles: ${listViewRecompensasRecord.stockDisponible.toString()}'
                                                    : 'Agotada')
                                                : 'Disponible'
                                                    .maybeHandleOverflow(
                                                    maxChars: 70,
                                                    replacement: '…',
                                                  ),
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  font: GoogleFonts.roboto(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              AuthUserStreamWidget(
                                                builder: (context) =>
                                                    FFButtonWidget(
                                                  onPressed: ((valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.puntosDisponibles,
                                                                  0) <
                                                              listViewRecompensasRecord
                                                                  .costoPuntos) ||
                                                          ((listViewRecompensasRecord
                                                                      .stockLimitado ==
                                                                  true) &&
                                                              (listViewRecompensasRecord
                                                                      .stockDisponible <=
                                                                  0)) ||
                                                          (_model.procesandoCanje ==
                                                              true))
                                                      ? null
                                                      : () async {
                                                          if (_model
                                                                  .procesandoCanje ==
                                                              false) {
                                                            _model.procesandoCanje =
                                                                true;
                                                            safeSetState(() {});
                                                            var confirmDialogResponse =
                                                                await showDialog<
                                                                        bool>(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              Text('Canjear recompensa'),
                                                                          content:
                                                                              Text('¿Querés canjear ${listViewRecompensasRecord.costoPuntos.toString()} puntos por ${listViewRecompensasRecord.nombre}? Obtendrás un cupón para presentar en el museo.'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                              child: Text('Cancelar'),
                                                                            ),
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                              child: Text('Confirmar'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    ) ??
                                                                    false;
                                                            if (confirmDialogResponse) {
                                                              if (FFAppState()
                                                                          .solicitudCanjeId !=
                                                                      '') {
                                                                if ((FFAppState()
                                                                            .usuarioCanjeUid ==
                                                                        currentUserUid) &&
                                                                    (FFAppState()
                                                                            .recompensaCanjeId ==
                                                                        listViewRecompensasRecord
                                                                            .reference
                                                                            .id)) {
                                                                  try {
                                                                    final result = await FirebaseFunctions
                                                                        .instance
                                                                        .httpsCallable(
                                                                            'canjearRecompensa')
                                                                        .call({
                                                                      "recompensaId":
                                                                          FFAppState()
                                                                              .recompensaCanjeId,
                                                                      "solicitudId":
                                                                          FFAppState()
                                                                              .solicitudCanjeId,
                                                                    });
                                                                    _model.resultadoCanje =
                                                                        CanjearRecompensaCloudFunctionCallResponse(
                                                                      data: result
                                                                          .data,
                                                                      succeeded:
                                                                          true,
                                                                      resultAsString: result
                                                                          .data
                                                                          .toString(),
                                                                      jsonBody:
                                                                          result
                                                                              .data,
                                                                    );
                                                                  } on FirebaseFunctionsException catch (error) {
                                                                    _model.resultadoCanje =
                                                                        CanjearRecompensaCloudFunctionCallResponse(
                                                                      errorCode:
                                                                          error
                                                                              .code,
                                                                      succeeded:
                                                                          false,
                                                                    );
                                                                  }

                                                                  if (_model
                                                                      .resultadoCanje!
                                                                      .succeeded!) {
                                                                    _model.ultimoCanjeId = _model
                                                                        .resultadoCanje
                                                                        ?.resultAsString;
                                                                    safeSetState(
                                                                        () {});
                                                                    if (_model.resultadoCanje?.resultAsString !=
                                                                            null &&
                                                                        _model.resultadoCanje?.resultAsString !=
                                                                            '') {
                                                                      FFAppState()
                                                                          .solicitudCanjeId = '';
                                                                      FFAppState()
                                                                          .recompensaCanjeId = '';
                                                                      FFAppState()
                                                                          .usuarioCanjeUid = '';
                                                                      safeSetState(
                                                                          () {});
                                                                      _model.procesandoCanje =
                                                                          false;
                                                                      safeSetState(
                                                                          () {});
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        SnackBar(
                                                                          content:
                                                                              Text(
                                                                            'Canje realizado correctamente. Tu cupón está pendiente de uso.',
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                            ),
                                                                          ),
                                                                          duration:
                                                                              Duration(milliseconds: 4000),
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).success,
                                                                        ),
                                                                      );
                                                                    } else {
                                                                      _model.procesandoCanje =
                                                                          false;
                                                                      safeSetState(
                                                                          () {});
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        SnackBar(
                                                                          content:
                                                                              Text(
                                                                            'No se pudo confirmar el cupón recibido',
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                            ),
                                                                          ),
                                                                          duration:
                                                                              Duration(milliseconds: 4000),
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                        ),
                                                                      );
                                                                    }
                                                                  } else {
                                                                    _model.procesandoCanje =
                                                                        false;
                                                                    safeSetState(
                                                                        () {});
                                                                    if (_model
                                                                            .resultadoCanje
                                                                            ?.errorCode ==
                                                                        'failed-precondition') {
                                                                      FFAppState()
                                                                          .solicitudCanjeId = '';
                                                                      FFAppState()
                                                                          .recompensaCanjeId = '';
                                                                      FFAppState()
                                                                          .usuarioCanjeUid = '';
                                                                      safeSetState(
                                                                          () {});
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        SnackBar(
                                                                          content:
                                                                              Text(
                                                                            'No se pudo realizar el canje. Revisá tu saldo y la disponibilidad de la recompensa.',
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                            ),
                                                                          ),
                                                                          duration:
                                                                              Duration(milliseconds: 4000),
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                        ),
                                                                      );
                                                                    }
                                                                  }
                                                                } else {
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        'Hay un canje pendiente de confirmar. Volvé a intentar la recompensa original con la cuenta que inició el canje.',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                        ),
                                                                      ),
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              4000),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondary,
                                                                    ),
                                                                  );
                                                                  _model.procesandoCanje =
                                                                      false;
                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                              } else {
                                                                FFAppState()
                                                                        .solicitudCanjeId =
                                                                    random_data
                                                                        .randomString(
                                                                  32,
                                                                  32,
                                                                  true,
                                                                  false,
                                                                  false,
                                                                );
                                                                FFAppState()
                                                                        .recompensaCanjeId =
                                                                    listViewRecompensasRecord
                                                                        .reference
                                                                        .id;
                                                                FFAppState()
                                                                        .usuarioCanjeUid =
                                                                    currentUserUid;
                                                                safeSetState(
                                                                    () {});
                                                              }
                                                            } else {
                                                              _model.procesandoCanje =
                                                                  false;
                                                              safeSetState(
                                                                  () {});
                                                            }
                                                          }

                                                          safeSetState(() {});
                                                        },
                                                  text: (listViewRecompensasRecord
                                                                  .stockLimitado ==
                                                              true) &&
                                                          (listViewRecompensasRecord
                                                                  .stockDisponible <=
                                                              0)
                                                      ? 'Agotada'
                                                      : (valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.puntosDisponibles,
                                                                  0) <
                                                              listViewRecompensasRecord
                                                                  .costoPuntos
                                                          ? 'Puntos insuficientes'
                                                          : 'Canjear'),
                                                  options: FFButtonOptions(
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .outfit(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                          ),
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontStyle,
                                                        ),
                                                    elevation: 0.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
