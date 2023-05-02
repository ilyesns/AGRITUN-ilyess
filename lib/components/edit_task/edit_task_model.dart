import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '../../tools/animations.dart';
import '../../tools/theme.dart';
import '../../tools/util.dart';
import '../../tools/widgets.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditTaskModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for taskname widget.
  TextEditingController? tasknameController;
  String? Function(BuildContext, String?)? tasknameControllerValidator;
  // State field(s) for taskdescription widget.
  TextEditingController? taskdescriptionController;
  String? Function(BuildContext, String?)? taskdescriptionControllerValidator;
  DateTime? datePicked1;
  DateTime? datePicked2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    tasknameController?.dispose();
    taskdescriptionController?.dispose();
  }

  /// Additional helper methods are added here.
}
