import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '../../tools/animations.dart';
import '../../tools/theme.dart';
import '../../tools/util.dart';
import '../../tools/widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddDeviceModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nameDevice widget.
  TextEditingController? nameDeviceController;
  String? Function(BuildContext, String?)? nameDeviceControllerValidator;
  String? _nameDeviceControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'nln67zk6' /* Field is required */,
      );
    }

    if (val.length < 5) {
      return 'Requires at least 5 characters.';
    }
    if (val.length > 10) {
      return 'Maximum 10 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for sn_device widget.
  TextEditingController? snDeviceController;
  String? Function(BuildContext, String?)? snDeviceControllerValidator;
  String? _snDeviceControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'r6yk6o97' /* Field is required */,
      );
    }

    if (val.length < 5) {
      return 'Requires at least 5 characters.';
    }
    if (val.length > 10) {
      return 'Maximum 10 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // Stores action output result for [Custom Action - verifyYDDocs] action in Button widget.
  bool? verf;
  // Stores action output result for [Custom Action - verifyDevDocs] action in Button widget.
  bool? verf2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    nameDeviceControllerValidator = _nameDeviceControllerValidator;
    snDeviceControllerValidator = _snDeviceControllerValidator;
  }

  void dispose() {
    nameDeviceController?.dispose();
    snDeviceController?.dispose();
  }

  /// Additional helper methods are added here.
}
