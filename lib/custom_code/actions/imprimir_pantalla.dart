// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:web/web.dart' as web;
import 'dart:js_interop';
import 'dart:async';

Future imprimirPantalla(String datosQR, String tituloMision) async {
  final qrUrl =
      'https://api.qrserver.com/v1/create-qr-code/?size=300x300&data=$datosQR';

  final div = web.document.createElement('div') as web.HTMLDivElement;
  div.id = 'print-section';

  final String htmlContent = '''
    <style>
      @media print {
        flt-glass-pane, flutter-view, body > div:not(#print-section) { 
          display: none !important; 
        }
        #print-section { 
          display: block !important; 
          width: 100%; 
          text-align: center; 
          margin-top: 20px; 
          font-family: Arial, sans-serif;
        }
        .ticket {
          border: 2px dashed #333;
          display: inline-block;
          /* Reducimos el padding superior a 20px para que el texto suba */
          padding: 20px 40px 40px 40px; 
          border-radius: 15px;
          min-height: 420px; /* Fuerza el tamaño de la caja aunque la foto tarde */
        }
        h2 { color: #333; margin: 0 0 5px 0; font-size: 32px; }
        p { color: #666; margin: 0 0 20px 0; font-size: 18px; }
        img { width: 300px; height: 300px; display: block; margin: 0 auto; }
      }
      @media screen {
        #print-section { display: none !important; }
      }
    </style>
    
    <div class="ticket">
      <h2>$tituloMision</h2>
      <p>Escanea este código para encontrar la parada</p>
      <img src="$qrUrl" />
    </div>
  ''';

  div.innerHTML = htmlContent.toJS;
  web.document.body?.append(div as JSAny);

  // Aumentamos a 2000 milisegundos (2 segundos) para garantizar la descarga del QR
  Timer(const Duration(milliseconds: 2000), () {
    web.window.print();
    div.remove();
  });
}
