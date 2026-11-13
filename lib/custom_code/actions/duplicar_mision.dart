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

Future<DocumentReference> duplicarMision(
  DocumentReference misionOriginalRef,
) async {
  final db = FirebaseFirestore.instance;
  final misiones = db.collection('misiones');
  final desafios = db.collection('desafios');

  final original = await misiones.doc(misionOriginalRef.id).get();
  final datos = original.data();

  if (datos == null) {
    throw StateError('La misión seleccionada ya no existe.');
  }

  final nombre = (datos['nombre_mision'] as String?)?.trim();
  if (nombre == null || nombre.isEmpty) {
    throw StateError('La misión seleccionada no tiene nombre.');
  }

  final resultado = await desafios
      .where('mision_desafio_fk', isEqualTo: original.reference)
      .get();

  final vigentes = resultado.docs
      .where((doc) => doc.data()['esta_archivado'] != true)
      .toList();

  // El recorrido del visitante busca el siguiente número de forma consecutiva.
  final ordenes = <int>{};
  for (final desafio in vigentes) {
    final orden = desafio.data()['numero_orden'];
    if (orden is! int || orden < 1 || !ordenes.add(orden)) {
      throw StateError(
        'Revisá el orden de los desafíos: hay un número inválido o repetido.',
      );
    }
  }

  vigentes.sort((a, b) {
    final ordenA = a.data()['numero_orden'] as int;
    final ordenB = b.data()['numero_orden'] as int;
    return ordenA.compareTo(ordenB);
  });

  final copia = misiones.doc();
  final lote = db.batch();

  final datosCopia = Map<String, dynamic>.from(datos);
  datosCopia.remove('insignia_ref');

  lote.set(copia, {
    ...datosCopia,
    'nombre_mision': 'Copia de $nombre',
    'esta_activa': false,
    'esta_archivada': false,
  });

  for (var i = 0; i < vigentes.length; i++) {
    lote.set(desafios.doc(), {
      ...vigentes[i].data(),
      'mision_desafio_fk': copia,
      'numero_orden': i + 1,
      'esta_archivado': false,
    });
  }

  await lote.commit();
  return copia;
}
