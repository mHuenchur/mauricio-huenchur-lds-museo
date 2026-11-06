import 'package:flutter/material.dart'
    show ChangeNotifier, Color, Colors, VoidCallback;
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _solicitudCanjeId =
          prefs.getString('ff_solicitudCanjeId') ?? _solicitudCanjeId;
    });
    _safeInit(() {
      _recompensaCanjeId =
          prefs.getString('ff_recompensaCanjeId') ?? _recompensaCanjeId;
    });
    _safeInit(() {
      _usuarioCanjeUid =
          prefs.getString('ff_usuarioCanjeUid') ?? _usuarioCanjeUid;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _solicitudCanjeId = '';
  String get solicitudCanjeId => _solicitudCanjeId;
  set solicitudCanjeId(String value) {
    _solicitudCanjeId = value;
    prefs.setString('ff_solicitudCanjeId', value);
  }

  String _recompensaCanjeId = '';
  String get recompensaCanjeId => _recompensaCanjeId;
  set recompensaCanjeId(String value) {
    _recompensaCanjeId = value;
    prefs.setString('ff_recompensaCanjeId', value);
  }

  String _usuarioCanjeUid = '';
  String get usuarioCanjeUid => _usuarioCanjeUid;
  set usuarioCanjeUid(String value) {
    _usuarioCanjeUid = value;
    prefs.setString('ff_usuarioCanjeUid', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
