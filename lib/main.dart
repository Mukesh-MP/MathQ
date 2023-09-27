import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mathq/firebase/gobal.dart';
import 'package:mathq/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await firebaseGlobal();

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
