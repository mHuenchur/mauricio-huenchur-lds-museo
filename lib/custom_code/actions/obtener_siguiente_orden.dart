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

Future<int> obtenerSiguienteOrden(DocumentReference misionRef) async {
  final db = FirebaseFirestore.instance;

  final resultado = await db
      .collection('desafios')
      .where('mision_desafio_fk', isEqualTo: misionRef)
      .where('esta_archivado', isEqualTo: false)
      .orderBy('numero_orden')
      .get(const GetOptions(source: Source.server));

  final desafios = resultado.docs;
  final lote = db.batch();
  var hayCambios = false;

  for (var i = 0; i < desafios.length; i++) {
    final numeroCorrecto = i + 1;
    if (desafios[i].data()['numero_orden'] != numeroCorrecto) {
      lote.update(desafios[i].reference, {'numero_orden': numeroCorrecto});
      hayCambios = true;
    }
  }

  if (hayCambios) {
    await lote.commit();
  }

  return desafios.length + 1;
}
