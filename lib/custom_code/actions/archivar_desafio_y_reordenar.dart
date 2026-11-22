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

Future archivarDesafioYReordenar(DocumentReference desafioRef) async {
  final db = FirebaseFirestore.instance;
  const desdeServidor = GetOptions(source: Source.server);

  final seleccionado = await desafioRef.get(desdeServidor);
  if (!seleccionado.exists) {
    throw Exception('No se encontró el desafío que querés archivar.');
  }

  final misionRef = seleccionado.get('mision_desafio_fk') as DocumentReference;

  final resultado = await db
      .collection('desafios')
      .where('mision_desafio_fk', isEqualTo: misionRef)
      .where('esta_archivado', isEqualTo: false)
      .orderBy('numero_orden')
      .get(desdeServidor);

  final lote = db.batch();
  lote.update(desafioRef, {'esta_archivado': true});

  var numeroNuevo = 1;
  for (final desafio in resultado.docs) {
    if (desafio.reference == desafioRef) continue;

    if (desafio.data()['numero_orden'] != numeroNuevo) {
      lote.update(desafio.reference, {'numero_orden': numeroNuevo});
    }
    numeroNuevo++;
  }

  await lote.commit();
}
