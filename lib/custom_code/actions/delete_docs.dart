// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '../../tools/theme.dart';
import '../../tools/util.dart';
import 'index.dart'; // Imports other custom actions
import '/tools/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future deleteDocs(
  DocumentReference? idplatform,
) async {
  WriteBatch batch = FirebaseFirestore.instance.batch();

  FirebaseFirestore.instance
      .collection('devices')
      .where("idPlat", isEqualTo: idplatform)
      .get()
      .then((querySnapshot) {
    querySnapshot.docs.forEach((document) {
      document.reference.delete();
    });
  });
}
