import '/auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/set_location/set_location_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WeatherPageModel extends FlutterFlowModel {
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
