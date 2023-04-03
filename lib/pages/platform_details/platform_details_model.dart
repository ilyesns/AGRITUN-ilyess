import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/edit_device/edit_device_widget.dart';
import '/components/pop_updp/pop_updp_widget.dart';
import '/components/popupwarning/popupwarning_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PlatformDetailsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for platformname widget.
  TextEditingController? platformnameController;
  String? Function(BuildContext, String?)? platformnameControllerValidator;
  String? _platformnameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'r25r1pls' /* Field is required */,
      );
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    platformnameControllerValidator = _platformnameControllerValidator;
  }

  void dispose() {
    platformnameController?.dispose();
  }

  /// Additional helper methods are added here.

}
