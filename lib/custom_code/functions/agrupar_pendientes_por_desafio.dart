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

List<PendientesDesafioStruct> agruparPendientesPorDesafio(
    List<ProgresoMisionVisitanteRecord> progresos) {
  final cantidades = <String, int>{};
  final nombres = <String, String>{};
  final numeros = <String, int>{};

  for (final progreso in progresos) {
    final misionId = progreso.misionId.trim();
    final numero = progreso.numeroDesafioActual;
    final clave = '$misionId/$numero';

    cantidades[clave] = (cantidades[clave] ?? 0) + 1;
    numeros[clave] = numero;

    final nombre = progreso.nombreMisionInicio.trim();
    if (nombre.isNotEmpty) {
      nombres[clave] = nombre;
    } else {
      nombres.putIfAbsent(
        clave,
        () => misionId.isEmpty ? 'Misión sin identificar' : 'Misión $misionId',
      );
    }
  }

  final filas = cantidades.entries.map((entrada) {
    final clave = entrada.key;
    return PendientesDesafioStruct(
      nombreMision: nombres[clave]!,
      numeroDesafio: numeros[clave]!,
      cantidad: entrada.value,
    );
  }).toList();

  filas.sort((a, b) {
    final porCantidad = b.cantidad.compareTo(a.cantidad);
    if (porCantidad != 0) return porCantidad;

    final porMision =
        a.nombreMision.toLowerCase().compareTo(b.nombreMision.toLowerCase());
    if (porMision != 0) return porMision;

    return a.numeroDesafio.compareTo(b.numeroDesafio);
  });

  return filas;
}
