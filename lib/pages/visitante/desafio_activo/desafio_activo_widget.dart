import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'desafio_activo_model.dart';
export 'desafio_activo_model.dart';

class DesafioActivoWidget extends StatefulWidget {
  const DesafioActivoWidget({
    super.key,
    required this.misionActual,
    required this.numeroPistaParam,
  });

  final DocumentReference? misionActual;
  final int? numeroPistaParam;

  static String routeName = 'desafio_activo';
  static String routePath = '/desafioActivo';

  @override
  State<DesafioActivoWidget> createState() => _DesafioActivoWidgetState();
}

class _DesafioActivoWidgetState extends State<DesafioActivoWidget> {
  late DesafioActivoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DesafioActivoModel());

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
        backgroundColor: Color(0xFFF1F4F8),
        body: SafeArea(
          top: true,
          child: StreamBuilder<List<ProgresoMisionVisitanteRecord>>(
            stream: queryProgresoMisionVisitanteRecord(
              queryBuilder: (progresoMisionVisitanteRecord) =>
                  progresoMisionVisitanteRecord
                      .where(
                        'mision_id',
                        isEqualTo: widget.misionActual?.id,
                      )
                      .where(
                        'visitante_id',
                        isEqualTo: currentUserReference?.id,
                      ),
              singleRecord: true,
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
              List<ProgresoMisionVisitanteRecord>
                  stackProgresoMisionVisitanteRecordList = snapshot.data!;
              // Return an empty Container when the item does not exist.
              if (snapshot.data!.isEmpty) {
                return Container();
              }
              final stackProgresoMisionVisitanteRecord =
                  stackProgresoMisionVisitanteRecordList.isNotEmpty
                      ? stackProgresoMisionVisitanteRecordList.first
                      : null;

              return Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                      child: StreamBuilder<List<DesafiosRecord>>(
                        stream: queryDesafiosRecord(
                          queryBuilder: (desafiosRecord) => desafiosRecord
                              .where(
                                'mision_desafio_fk',
                                isEqualTo: widget.misionActual,
                              )
                              .where(
                                'numero_orden',
                                isEqualTo: widget.numeroPistaParam,
                              ),
                          singleRecord: true,
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
                          List<DesafiosRecord> columnDesafiosRecordList =
                              snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final columnDesafiosRecord =
                              columnDesafiosRecordList.isNotEmpty
                                  ? columnDesafiosRecordList.first
                                  : null;

                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment:
                                (FFMainAxisAlignment.start).flutterValue,
                            crossAxisAlignment:
                                (FFCrossAxisAlignment.center).flutterValue,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 12.0, 16.0, 12.0),
                                  child: Container(
                                    width: double.infinity,
                                    constraints: BoxConstraints(
                                      maxWidth: 530.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 3.0,
                                          color: Color(0x33000000),
                                          offset: Offset(
                                            0.0,
                                            1.0,
                                          ),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(24.0),
                                      border: Border.all(
                                        color: Color(0xFFF5FBFB),
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 12.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 16.0, 24.0, 16.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'PISTA PRINCIPAL',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleLarge
                                                      .override(
                                                        font:
                                                            GoogleFonts.outfit(
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
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
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 12.0, 0.0, 0.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      columnDesafiosRecord
                                                          ?.pistaBusqueda,
                                                      'PISTA PRINCIPAL',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelLarge
                                                        .override(
                                                          font: GoogleFonts
                                                              .roboto(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLarge
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLarge
                                                                  .fontStyle,
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
                                ),
                              ),
                              if (valueOrDefault<bool>(
                                _model.mostrarPistaExtra,
                                true,
                              ))
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 12.0, 16.0, 12.0),
                                    child: Container(
                                      width: double.infinity,
                                      constraints: BoxConstraints(
                                        maxWidth: 530.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 3.0,
                                            color: Color(0x33000000),
                                            offset: Offset(
                                              0.0,
                                              1.0,
                                            ),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                        border: Border.all(
                                          color: Color(0xFFF5FBFB),
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 12.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 16.0, 24.0, 16.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'PISTA EXTRA',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge
                                                        .override(
                                                          font: GoogleFonts
                                                              .outfit(
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
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
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 12.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        columnDesafiosRecord
                                                            ?.pistaExtra,
                                                        'PISTA EXTRA',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
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
                                  ),
                                ),
                              FFButtonWidget(
                                onPressed: () async {
                                  if (columnDesafiosRecord?.tipoValidacion ==
                                      'QR') {
                                    _model.codigoLeido =
                                        await FlutterBarcodeScanner.scanBarcode(
                                      '#C62828', // scanning line color
                                      'Cancel', // cancel button text
                                      true, // whether to show the torch (camera LED) toggle icon
                                      ScanMode.QR,
                                    );

                                    if (_model.codigoLeido ==
                                        columnDesafiosRecord?.reference.id) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Objeto encontrado!',
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
                                                  .success,
                                        ),
                                      );
                                      _model.mostrarPistaExtra = false;
                                      safeSetState(() {});
                                      _model.numeroDesafioSiguiente =
                                          await queryDesafiosRecordOnce(
                                        queryBuilder: (desafiosRecord) =>
                                            desafiosRecord
                                                .where(
                                                  'mision_desafio_fk',
                                                  isEqualTo:
                                                      widget.misionActual,
                                                )
                                                .where(
                                                  'numero_orden',
                                                  isEqualTo:
                                                      stackProgresoMisionVisitanteRecord!
                                                              .numeroDesafioActual +
                                                          1,
                                                )
                                                .where(
                                                  'esta_archivado',
                                                  isEqualTo: false,
                                                ),
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);
                                      if (_model.numeroDesafioSiguiente
                                                  ?.reference.id !=
                                              null &&
                                          _model.numeroDesafioSiguiente
                                                  ?.reference.id !=
                                              '') {
                                        await stackProgresoMisionVisitanteRecord!
                                            .reference
                                            .update({
                                          ...mapToFirestore(
                                            {
                                              'numero_desafio_actual':
                                                  FieldValue.increment(1),
                                            },
                                          ),
                                        });

                                        context.pushNamed(
                                          DesafioActivoWidget.routeName,
                                          queryParameters: {
                                            'misionActual': serializeParam(
                                              widget.misionActual,
                                              ParamType.DocumentReference,
                                            ),
                                            'numeroPistaParam': serializeParam(
                                              _model.numeroDesafioSiguiente
                                                  ?.numeroOrden,
                                              ParamType.int,
                                            ),
                                          }.withoutNulls,
                                        );
                                      } else {
                                        await stackProgresoMisionVisitanteRecord!
                                            .reference
                                            .update(
                                                createProgresoMisionVisitanteRecordData(
                                          misionCompletada: true,
                                        ));

                                        context.goNamed(
                                            MisionCompletadaWidget.routeName);
                                      }
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Objeto incorrecto!',
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
                                                  .warning,
                                        ),
                                      );
                                      _model.mostrarPistaExtra = true;
                                      safeSetState(() {});
                                    }
                                  } else {
                                    final selectedMedia = await selectMedia(
                                      maxWidth: 800.00,
                                      imageQuality: 70,
                                      multiImage: false,
                                    );
                                    if (selectedMedia != null &&
                                        selectedMedia.every((m) =>
                                            validateFileFormat(
                                                m.storagePath, context))) {
                                      safeSetState(() =>
                                          _model.isDataUploading_uploadDataUq5 =
                                              true);
                                      var selectedUploadedFiles =
                                          <FFUploadedFile>[];

                                      var downloadUrls = <String>[];
                                      try {
                                        selectedUploadedFiles = selectedMedia
                                            .map((m) => FFUploadedFile(
                                                  name: m.storagePath
                                                      .split('/')
                                                      .last,
                                                  bytes: m.bytes,
                                                  height: m.dimensions?.height,
                                                  width: m.dimensions?.width,
                                                  blurHash: m.blurHash,
                                                  originalFilename:
                                                      m.originalFilename,
                                                ))
                                            .toList();

                                        downloadUrls = (await Future.wait(
                                          selectedMedia.map(
                                            (m) async => await uploadData(
                                                m.storagePath, m.bytes),
                                          ),
                                        ))
                                            .where((u) => u != null)
                                            .map((u) => u!)
                                            .toList();
                                      } finally {
                                        _model.isDataUploading_uploadDataUq5 =
                                            false;
                                      }
                                      if (selectedUploadedFiles.length ==
                                              selectedMedia.length &&
                                          downloadUrls.length ==
                                              selectedMedia.length) {
                                        safeSetState(() {
                                          _model.uploadedLocalFile_uploadDataUq5 =
                                              selectedUploadedFiles.first;
                                          _model.uploadedFileUrl_uploadDataUq5 =
                                              downloadUrls.first;
                                        });
                                      } else {
                                        safeSetState(() {});
                                        return;
                                      }
                                    }

                                    _model.respuestaIA =
                                        await actions.compararObjetosIA(
                                      columnDesafiosRecord!.imagenReferenciaIa,
                                      _model.uploadedFileUrl_uploadDataUq5,
                                      'CLAVE',
                                    );
                                    if (_model.respuestaIA == 'SI') {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Objeto encontrado!',
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
                                                  .success,
                                        ),
                                      );
                                      await FirebaseStorage.instance
                                          .refFromURL(_model
                                              .uploadedFileUrl_uploadDataUq5)
                                          .delete();
                                      _model.mostrarPistaExtra = false;
                                      safeSetState(() {});
                                      _model.numeroDesafioSiguienteIA =
                                          await queryDesafiosRecordOnce(
                                        queryBuilder: (desafiosRecord) =>
                                            desafiosRecord
                                                .where(
                                                  'mision_desafio_fk',
                                                  isEqualTo:
                                                      widget.misionActual,
                                                )
                                                .where(
                                                  'numero_orden',
                                                  isEqualTo:
                                                      stackProgresoMisionVisitanteRecord!
                                                              .numeroDesafioActual +
                                                          1,
                                                )
                                                .where(
                                                  'esta_archivado',
                                                  isEqualTo: false,
                                                ),
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);
                                      if (_model.numeroDesafioSiguienteIA
                                                  ?.reference.id !=
                                              null &&
                                          _model.numeroDesafioSiguienteIA
                                                  ?.reference.id !=
                                              '') {
                                        await stackProgresoMisionVisitanteRecord!
                                            .reference
                                            .update({
                                          ...mapToFirestore(
                                            {
                                              'numero_desafio_actual':
                                                  FieldValue.increment(1),
                                            },
                                          ),
                                        });

                                        context.pushNamed(
                                          DesafioActivoWidget.routeName,
                                          queryParameters: {
                                            'misionActual': serializeParam(
                                              widget.misionActual,
                                              ParamType.DocumentReference,
                                            ),
                                            'numeroPistaParam': serializeParam(
                                              _model.numeroDesafioSiguienteIA
                                                  ?.numeroOrden,
                                              ParamType.int,
                                            ),
                                          }.withoutNulls,
                                        );
                                      } else {
                                        await stackProgresoMisionVisitanteRecord!
                                            .reference
                                            .update(
                                                createProgresoMisionVisitanteRecordData(
                                          misionCompletada: true,
                                        ));

                                        context.goNamed(
                                            MisionCompletadaWidget.routeName);
                                      }
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            _model.respuestaIA!,
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
                                                  .warning,
                                        ),
                                      );
                                      await FirebaseStorage.instance
                                          .refFromURL(_model
                                              .uploadedFileUrl_uploadDataUq5)
                                          .delete();
                                      _model.mostrarPistaExtra = true;
                                      safeSetState(() {});
                                    }
                                  }

                                  safeSetState(() {});
                                },
                                text: 'Camara',
                                icon: Icon(
                                  Icons.camera_alt,
                                  size: 30.0,
                                ),
                                options: FFButtonOptions(
                                  width: 200.0,
                                  height: 60.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFF0CDCF9),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        font: GoogleFonts.outfit(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .fontStyle,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
