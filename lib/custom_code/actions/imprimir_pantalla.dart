// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart' hide RepeatMode;
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

Future imprimirPantalla(String datosQR, String tituloMision) async {
  if (datosQR.trim().isEmpty) {
    throw ArgumentError(
        'Falta el identificador del desafío para generar el QR.');
  }

  await Printing.layoutPdf(
    name: 'Desafio-QR.pdf',
    format: PdfPageFormat.a4,
    onLayout: (formato) async {
      final documento = pw.Document(
        compress: false,
        version: PdfVersion.pdf_1_4,
      );

      documento.addPage(
        pw.Page(
          pageFormat: formato,
          build: (context) => pw.Align(
            alignment: pw.Alignment.topCenter,
            child: pw.Container(
              padding: const pw.EdgeInsets.all(24),
              decoration: pw.BoxDecoration(
                border: pw.Border.all(color: PdfColors.grey600),
                borderRadius: pw.BorderRadius.circular(12),
              ),
              child: pw.Column(
                mainAxisSize: pw.MainAxisSize.min,
                children: [
                  pw.Text(
                    tituloMision,
                    textAlign: pw.TextAlign.center,
                    style: pw.TextStyle(
                      fontSize: 24,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.SizedBox(height: 8),
                  pw.Text(
                    'Escaneá este código para encontrar la parada',
                    textAlign: pw.TextAlign.center,
                  ),
                  pw.SizedBox(height: 16),
                  pw.BarcodeWidget(
                    barcode: pw.Barcode.qrCode(),
                    data: datosQR,
                    width: 180,
                    height: 180,
                    padding: const pw.EdgeInsets.all(24),
                    backgroundColor: PdfColors.white,
                    drawText: false,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      return documento.save();
    },
  );
}
