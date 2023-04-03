import 'package:flutter/material.dart';
import 'backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  LatLng? _location = LatLng(36.8064948, 10.1815316);
  LatLng? get location => _location;
  set location(LatLng? _value) {
    _location = _value;
  }

  bool _deletep = false;
  bool get deletep => _deletep;
  set deletep(bool _value) {
    _deletep = _value;
  }

  bool _isEmailField = false;
  bool get isEmailField => _isEmailField;
  set isEmailField(bool _value) {
    _isEmailField = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
