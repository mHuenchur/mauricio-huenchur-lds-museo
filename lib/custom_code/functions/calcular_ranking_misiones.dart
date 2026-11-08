import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import '/flutter_flow/custom_functions.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart' hide Type;
import '/backend/schema/structs/index.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/auth/firebase_auth/auth_util.dart';

List<EstadisticaMisionStruct> calcularRankingMisiones(
  List<MisionesRecord> misiones,
  List<ProgresoMisionVisitanteRecord> progresos,
) {
  final nombres = <String, String>{};
  final iniciadas = <String, int>{};
  final completadas = <String, int>{};

  for (final mision in misiones) {
    final id = mision.reference.id;
    final nombre =
        (mision.snapshotData['nombre_mision'] as String?)?.trim() ?? '';
    nombres[id] = nombre;
  }

  for (final progreso in progresos) {
    final id = progreso.misionId.trim();
    if (id.isEmpty) continue;

    // Conserva el nombre histórico si la misión ya no está en el catálogo.
    if ((nombres[id] ?? '').isEmpty) {
      nombres[id] = progreso.nombreMisionInicio.trim();
    }

    iniciadas[id] = (iniciadas[id] ?? 0) + 1;

    if (progreso.misionCompletada) {
      completadas[id] = (completadas[id] ?? 0) + 1;
    }
  }

  final ids = nombres.keys.toList();
  ids.sort((a, b) {
    final porInicios = (iniciadas[b] ?? 0).compareTo(iniciadas[a] ?? 0);
    if (porInicios != 0) return porInicios;

    final porNombre =
        nombres[a]!.toLowerCase().compareTo(nombres[b]!.toLowerCase());
    return porNombre != 0 ? porNombre : a.compareTo(b);
  });

  final maxInicios = ids.isEmpty ? 0 : (iniciadas[ids.first] ?? 0);

  return ids.map((id) {
    final total = iniciadas[id] ?? 0;
    final terminadas = completadas[id] ?? 0;

    return EstadisticaMisionStruct(
      nombre: nombres[id]!.isEmpty ? 'Misión $id' : nombres[id]!,
      iniciadas: total,
      completadas: terminadas,
      finalizacionTexto:
          total == 0 ? '—' : '${(terminadas * 100 / total).round()} %',
      barraInicios: maxInicios == 0 ? 0.0 : total / maxInicios,
    );
  }).toList();
}
