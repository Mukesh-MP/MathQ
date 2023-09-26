import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mathq/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp app;
  try {
    if (Platform.isAndroid) {
      app = await Firebase.initializeApp(
          name: "MathQ_Firebase_Android",
          options: DefaultFirebaseOptions.android);
    }
  } catch (e) {
    print(e);
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          appBarTheme:
              const AppBarTheme(elevation: 0, backgroundColor: Colors.purple)),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
