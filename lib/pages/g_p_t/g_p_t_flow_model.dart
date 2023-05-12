import '/backend/api_requests/api_calls.dart';
import '../../tools/icon_button.dart';
import '../../tools/theme.dart';
import '../../tools/util.dart';
import '../../tools/widgets.dart';
import 'dart:ui';
import '/tools/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GPTFlowModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  String? inputContent = '';

  dynamic chatHistory;

  ///  State fields for stateful widgets in this page.

  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (Send Full Prompt)] action in IconButton widget.
  ApiCallResponse? chatGPTResponse;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    listViewController = ScrollController();
  }

  void dispose() {
    listViewController?.dispose();
    textController?.dispose();
  }

  /// Additional helper methods are added here.
}