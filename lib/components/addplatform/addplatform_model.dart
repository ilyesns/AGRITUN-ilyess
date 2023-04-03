import '/auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddplatformModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for platformname widget.
  TextEditingController? platformnameController;
  String? Function(BuildContext, String?)? platformnameControllerValidator;
  String? _platformnameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'jcvt4ej7' /* Field is required */,
      );
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (mqttApiListClient)] action in Button widget.
  ApiCallResponse? apiResulthjh;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    platformnameControllerValidator = _platformnameControllerValidator;
  }

  void dispose() {
    platformnameController?.dispose();
  }

  /// Additional helper methods are added here.

}
