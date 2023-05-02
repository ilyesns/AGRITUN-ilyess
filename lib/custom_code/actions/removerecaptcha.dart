// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '../../tools/theme.dart';
import '../../tools/util.dart';
import 'index.dart'; // Imports other custom actions
import '/tools/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:universal_html/html.dart' as html1;

Future removerecaptcha() async {
  // Add your function code here!
  var captcha = html1.querySelector('#__ff-recaptcha-container');
  if (captcha != null) {
    captcha.hidden = true;
  }
  return;
}
