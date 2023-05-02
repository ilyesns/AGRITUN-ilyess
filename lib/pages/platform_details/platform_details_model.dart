import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/edit_device/edit_device_widget.dart';
import '/components/location_card_platform/location_card_platform_widget.dart';
import '/components/popupwarning/popupwarning_widget.dart';
import '../../tools/icon_button.dart';
import '../../tools/theme.dart';
import '../../tools/util.dart';
import '../../tools/widgets.dart';
import '/tools/upload_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PlatformDetailsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

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
