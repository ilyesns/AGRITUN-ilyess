import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '../tools/theme.dart';
import '../tools/util.dart';
import '../tools/widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DeviceDetailsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (mqttApiListClient)] action in Button widget.
  ApiCallResponse? apiResult3rp;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.
}
