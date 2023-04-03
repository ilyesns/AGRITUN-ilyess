import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/popuplogout/popuplogout_widget.dart';
import '/components/set_location/set_location_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfilePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
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
