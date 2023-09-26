import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mathq/login/controller/login_controller.dart';

LinearGradient signupGradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromARGB(255, 245, 151, 242),
      Color.fromARGB(255, 241, 226, 245),
      Color.fromARGB(255, 192, 116, 207),
      Color.fromARGB(255, 227, 178, 237)
    ]);

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var loginController = Get.put(LoginController());
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          shadowColor: const Color.fromARGB(255, 234, 103, 230),
          elevation: 1,
          backgroundColor: const Color.fromARGB(255, 245, 151, 242),
        ),
        body: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              gradient: signupGradient,
            ),
            child: Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  const Text(
                    "SignUp",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: width * .65,
                    child: TextField(
                      controller: loginController.emailController,
                      decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(
                                color: Color.fromARGB(44, 255, 255, 255),
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(
                                color: Color.fromARGB(143, 255, 255, 255),
                              )),
                          contentPadding: EdgeInsets.only(left: 15),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Username",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)))),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: width * .65,
                    child: TextField(
                      controller: loginController.passwordController,
                      decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(
                                color: Color.fromARGB(44, 255, 255, 255),
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(
                                color: Color.fromARGB(143, 255, 255, 255),
                              )),
                          contentPadding: EdgeInsets.only(left: 15),
                          hintText: "Password",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          filled: true,
                          fillColor: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: width * .65,
                    child: TextField(
                      controller: loginController.confirmPasswordController,
                      decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(
                                color: Color.fromARGB(44, 255, 255, 255),
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(
                                color: Color.fromARGB(143, 255, 255, 255),
                              )),
                          contentPadding: EdgeInsets.only(left: 15),
                          hintText: "Confirm Password",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          filled: true,
                          fillColor: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: width * .65,
                    child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(255, 180, 4, 211)),
                          elevation: MaterialStatePropertyAll(10),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))))),
                      onPressed: () {
                        loginController.signUpSubmit();
                      },
                      child: const Text(
                        "Submit",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ]))));
  }
}
