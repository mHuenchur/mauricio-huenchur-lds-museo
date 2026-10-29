// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import 'package:flutter/material.dart' hide RepeatMode;
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> compararObjetosIA(
  String urlReferencia,
  String urlVisitante,
  String apiKey,
) async {
  try {
    if (urlReferencia.isEmpty || urlVisitante.isEmpty) {
      return "ERROR: Falta una URL";
    }

    // 1. Descargamos y validamos la foto del administrador
    final adminResponse = await http.get(Uri.parse(urlReferencia));
    if (adminResponse.statusCode != 200) {
      return "ERROR_IMG_ADMIN: Código ${adminResponse.statusCode}";
    }

    // 2. Descargamos y validamos la captura del visitante
    final visitanteResponse = await http.get(Uri.parse(urlVisitante));
    if (visitanteResponse.statusCode != 200) {
      return "ERROR_IMG_VISITANTE: Código ${visitanteResponse.statusCode}";
    }

    // 3. Convertimos a Base64
    final adminBase64 = base64Encode(adminResponse.bodyBytes);
    final visitanteBase64 = base64Encode(visitanteResponse.bodyBytes);

    // 4. El Prompt
    final prompt =
        "Actúa como un validador experto. Compara la Imagen 1 (referencia) con la Imagen 2 (captura del usuario). ¿Muestran exactamente el mismo objeto físico o la misma obra de arte, ignorando diferencias de ángulo, reflejos o iluminación? Responde estrictamente con la palabra SI o la palabra NO.";

    // 5. Petición a Gemini
    final geminiUrl =
        'https://generativelanguage.googleapis.com/v1beta/models/gemini-3.5-flash-lite:generateContent?key=$apiKey';

    final requestBody = {
      "contents": [
        {
          "parts": [
            {"text": prompt},
            {
              "inline_data": {"mime_type": "image/jpeg", "data": adminBase64}
            },
            {
              "inline_data": {
                "mime_type": "image/jpeg",
                "data": visitanteBase64
              }
            }
          ]
        }
      ]
    };

    // 6. Enviamos la consulta
    final response = await http.post(
      Uri.parse(geminiUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(requestBody),
    );

    // 7. Procesamos la respuesta
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final respuestaIA = data['candidates'][0]['content']['parts'][0]['text'];
      return respuestaIA.toString().trim().toUpperCase();
    } else {
      return "GEMINI_RECHAZO: ${response.statusCode} - ${response.body}";
    }
  } catch (e) {
    return "ERROR_DART: $e";
  }
}
