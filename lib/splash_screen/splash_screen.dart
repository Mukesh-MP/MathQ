import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mathq/config/constants.dart';
import 'package:mathq/login/screen/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      // Get.to(const LoginScreen());
      Get.to(() => const LoginScreen());
    });

    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
              Color.fromARGB(255, 179, 45, 250),
              Color.fromARGB(255, 214, 203, 225),
              Color.fromARGB(255, 195, 140, 251)
            ])),
        child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              GestureDetector(
                onTap: () => Get.to(() => const LoginScreen()),
                child: Image.asset(
                  welcomeIcon,
                  scale: 2,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Math",
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 45,
                        color: Color.fromARGB(255, 24, 2, 62)),
                  ),
                  Text(
                    "Q",
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 60,
                        color: Colors.orangeAccent[400]),
                  )
                ],
              )
            ])),
      ),
    );
  }
}
