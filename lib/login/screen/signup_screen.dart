import 'package:flutter/material.dart';

LinearGradient signupGradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromARGB(210, 125, 14, 121),
      Color.fromARGB(255, 98, 7, 118),
      Color.fromARGB(255, 225, 130, 244),
      Color.fromARGB(255, 227, 178, 237)
    ]);

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          shadowColor: const Color.fromARGB(210, 125, 14, 121),
          elevation: 1,
          backgroundColor: const Color.fromARGB(210, 125, 14, 121),
        ),
        body: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              gradient: signupGradient,
            ),
            child: const Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: []))));
  }
}
