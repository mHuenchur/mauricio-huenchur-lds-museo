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

List<PendientesDesafioStruct> agruparActivacionesPorDesafio(
    List<ActivacionesPistaExtraRecord> activaciones) {
  final filasPorDesafio = <String, PendientesDesafioStruct>{};

  for (final activacion in activaciones) {
    final referencia = activacion.desafioRef;
    if (referencia == null) continue;

    final clave = referencia.path;
    final fila = filasPorDesafio.putIfAbsent(clave, () {
      final nombre = activacion.nombreMision.trim();
      return PendientesDesafioStruct(
        nombreMision: nombre.isEmpty ? 'Misión sin nombre' : nombre,
        numeroDesafio: activacion.numeroDesafio,
        cantidad: 0,
      );
    });

    fila.cantidad = fila.cantidad + 1;
  }

  final filas = filasPorDesafio.values.toList();

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
