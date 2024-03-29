import '/auth/auth_util.dart';
import '../../tools/theme.dart';
import '../../tools/util.dart';
import '../../tools/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VerifyCodePhoneModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PhoneCode widget.
  TextEditingController? phoneCodeController;
  String? Function(BuildContext, String?)? phoneCodeControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    phoneCodeController?.dispose();
  }

  /// Additional helper methods are added here.
}
