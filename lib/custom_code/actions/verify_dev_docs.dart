// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<bool> verifyDevDocs(
  String? snDevice,
) async {
  dynamic snapShot;
  try {
    await FirebaseFirestore.instance
        .collection('devices')
        .where("sn_device", isEqualTo: snDevice)
        .get()
        .then((doc) {
      snapShot = doc.docs.isEmpty;
    });
    if (snapShot) {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    // If any error
    return false;
  }
}
