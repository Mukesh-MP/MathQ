import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mathq/login/screen/login_screen.dart';
import 'package:mathq/widgets/log.dart';
import 'package:mathq/widgets/toast.dart';

class LoginController extends GetxController {
  RxBool signInOptional = false.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  signUpSubmit() async {
    if (emailController.text.isEmpty || emailController.text == "") {
      showToast(msg: "Please enter your name");
    } else if (passwordController.text.isEmpty ||
        passwordController.text == "") {
      showToast(msg: "Please enter your password");
    } else if (confirmPasswordController.text.isEmpty ||
        confirmPasswordController.text == "") {
      showToast(msg: "Please confirm your password");
    } else if (passwordController.text != confirmPasswordController.text) {
      showToast(msg: "Password and Confirm Password are not same");
    } else {
      try {
        final newUser = await _auth.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
        // ignore: unnecessary_null_comparison
        if (newUser != null) {
          CustomLog.customprint(newUser.toString());
          showToast(
              msg: "User Registered successfully",
              backgroundColor: Colors.green);
          Future.delayed(const Duration(seconds: 2), () {
            Get.off(const LoginScreen());
          });
        }
      } catch (e) {
        showToast(msg: "Error in registration");
        Get.off(const LoginScreen());
      }
    }
  }

  login() async {
    if (emailController.text.isEmpty || emailController.text == "") {
      showToast(msg: "Please enter your name");
    } else if (passwordController.text.isEmpty ||
        passwordController.text == "") {
      showToast(msg: "Please enter your password");
    } else if (confirmPasswordController.text.isEmpty ||
        confirmPasswordController.text == "") {
      showToast(msg: "Please confirm your password");
    } else {
      try {
        final userloginSuccess = await _auth.signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
        // ignore: unnecessary_null_comparison
        if (userloginSuccess != null) {
          showToast(msg: "Logined Successfully", backgroundColor: Colors.green);
          CustomLog.customprint(userloginSuccess.toString());
        }
      } catch (e) {
        showToast(msg: "Error in login");
        CustomLog.customprint(e.toString());
      }
    }
  }
}
