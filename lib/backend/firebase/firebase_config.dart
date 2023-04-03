import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBNwlULHhoXwT15uvLi13vh2PCawvoFpgE",
            authDomain: "agritun-fbd20.firebaseapp.com",
            projectId: "agritun-fbd20",
            storageBucket: "agritun-fbd20.appspot.com",
            messagingSenderId: "847079387815",
            appId: "1:847079387815:web:95aa3adec05f05d0142182",
            measurementId: "G-E943RMR71Y"));
  } else {
    await Firebase.initializeApp();
  }
}
