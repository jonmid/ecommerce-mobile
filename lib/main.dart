import 'package:app_mobile/app.dart';
import 'package:app_mobile/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Todo: Add widgets binding
  /// Todo: Init Local Storage
  /// Todo: Await native splash
  /// Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  /// Todo: Initialize Authentication

  runApp(const App());
}
