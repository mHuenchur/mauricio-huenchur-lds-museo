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

Future<void> registrarActivacionPistaExtra(
  DocumentReference progresoRef,
  DocumentReference desafioRef,
  String nombreMision,
  int numeroDesafio,
) async {
  final db = FirebaseFirestore.instance;
  final id = '${progresoRef.id}_${desafioRef.id}';
  final activacionRef = db.collection('activaciones_pista_extra').doc(id);

  await db.runTransaction<void>((transaccion) async {
    final activacion = await transaccion.get(activacionRef);
    if (activacion.exists) return;

    transaccion.set(activacionRef, {
      'progreso_ref': progresoRef,
      'desafio_ref': desafioRef,
      'nombre_mision': nombreMision,
      'numero_desafio': numeroDesafio,
      'fecha_solicitud': FieldValue.serverTimestamp(),
    });
  });
}
