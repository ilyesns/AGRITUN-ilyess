import '/backend/backend.dart';
import '../../tools/animations.dart';
import '../../tools/drop_down.dart';
import '../../tools/theme.dart';
import '../../tools/util.dart';
import '../../tools/widgets.dart';
import '/tools/form_field_controller.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateTaskModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for taskname widget.
  TextEditingController? tasknameController;
  String? Function(BuildContext, String?)? tasknameControllerValidator;
  String? _tasknameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '9zyue9or' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for taskdescription widget.
  TextEditingController? taskdescriptionController;
  String? Function(BuildContext, String?)? taskdescriptionControllerValidator;
  String? _taskdescriptionControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ckpwgwz9' /* Field is required */,
      );
    }

    return null;
  }

  DateTime? datePicked1;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    tasknameControllerValidator = _tasknameControllerValidator;
    taskdescriptionControllerValidator = _taskdescriptionControllerValidator;
  }

  void dispose() {
    tasknameController?.dispose();
    taskdescriptionController?.dispose();
  }

  /// Additional helper methods are added here.
}
