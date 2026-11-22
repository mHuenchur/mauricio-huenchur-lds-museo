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

Future reordenarDesafios(
  List<DesafiosRecord> listaDesafios,
  int oldIndex,
  int newIndex,
) async {
  final ordenNuevo = List<DesafiosRecord>.of(listaDesafios);

  // Al arrastrar hacia abajo, quitar la fila desplaza el destino un lugar.
  final destino = oldIndex < newIndex ? newIndex - 1 : newIndex;
  if (destino == oldIndex) return;

  final desafioMovido = ordenNuevo.removeAt(oldIndex);
  ordenNuevo.insert(destino, desafioMovido);

  final lote = FirebaseFirestore.instance.batch();

  for (var i = 0; i < ordenNuevo.length; i++) {
    final desafio = ordenNuevo[i];
    final numeroNuevo = i + 1;

    if (desafio.numeroOrden != numeroNuevo) {
      lote.update(desafio.reference, {'numero_orden': numeroNuevo});
    }
  }

  await lote.commit();
}
