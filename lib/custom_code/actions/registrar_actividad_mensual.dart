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

import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> registrarActividadMensual(String visitanteId) async {
  final uid = visitanteId.trim();
  if (uid.isEmpty) return;

  final ahora = DateTime.now();
  final mes = ahora.month.toString().padLeft(2, '0');
  final periodo = '${ahora.year}-$mes';

  final documento = FirebaseFirestore.instance
      .collection('actividad_mensual_visitantes')
      .doc('${periodo}_$uid');

  await documento.set({
    'visitante_id': uid,
    'periodo': periodo,
  }, SetOptions(merge: true));
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the `</>` button on the right!
