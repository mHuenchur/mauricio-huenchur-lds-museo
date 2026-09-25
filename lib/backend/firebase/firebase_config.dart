import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBeqqrLkHaID5m339hZPaSJNNTG50S5_EY",
            authDomain: "lds2026-8uw2dx.firebaseapp.com",
            projectId: "lds2026-8uw2dx",
            storageBucket: "lds2026-8uw2dx.firebasestorage.app",
            messagingSenderId: "88183425566",
            appId: "1:88183425566:web:3f229f6a8050fd3698bc0f"));
  } else {
    await Firebase.initializeApp();
  }
}
