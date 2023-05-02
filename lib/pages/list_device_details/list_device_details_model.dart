import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/empty_platform_dev/empty_platform_dev_widget.dart';
import '/components/pop_updp/pop_updp_widget.dart';
import '/components/set_location/set_location_widget.dart';
import '../../tools/icon_button.dart';
import '../../tools/theme.dart';
import '../../tools/util.dart';
import '../../tools/widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/tools/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListDeviceDetailsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for setLocation component.
  late SetLocationModel setLocationModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    setLocationModel = createModel(context, () => SetLocationModel());
  }

  void dispose() {
    setLocationModel.dispose();
  }

  /// Additional helper methods are added here.
}
