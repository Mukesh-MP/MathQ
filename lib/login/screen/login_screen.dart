import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mathq/login/controller/login_controller.dart';
import 'package:mathq/login/screen/signup_screen.dart';

LinearGradient loginGradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromARGB(255, 239, 81, 234),
      Color.fromARGB(255, 241, 226, 245),
      Color.fromARGB(255, 192, 116, 207)
    ]);

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    //var height = MediaQuery.of(context).size.height;
    var loginController = Get.put(LoginController());

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(gradient: loginGradient),
            child: Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Obx(
                    () => Visibility(
                      visible: loginController.signInOptional.value == true
                          ? true
                          : false,
                      child: Column(
                        children: [
                          SizedBox(
                            width: width * .65,
                            child: TextField(
                              controller: loginController.emailController,
                              decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(44, 255, 255, 255),
                                      )),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(143, 199, 73, 253),
                                      )),
                                  contentPadding: EdgeInsets.only(left: 15),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: "Username",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20)))),
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
                                        color:
                                            Color.fromARGB(44, 255, 255, 255),
                                      )),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(143, 199, 73, 253),
                                      )),
                                  contentPadding: EdgeInsets.only(left: 15),
                                  hintText: "Password",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  filled: true,
                                  fillColor: Colors.white),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width * .65,
                        child: ElevatedButton(
                          style: const ButtonStyle(
                              shadowColor:
                                  MaterialStatePropertyAll(Colors.black),
                              backgroundColor: MaterialStatePropertyAll(
                                  Color.fromARGB(162, 224, 83, 249)),
                              elevation: MaterialStatePropertyAll(10),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))))),
                          onPressed: () {
                            if (loginController.signInOptional.value == false) {
                              loginController.signInOptional.value = true;
                            } else {
                              loginController.login();
                            }
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(226, 255, 255, 255),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: width * .65,
                    child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(161, 122, 32, 138)),
                          elevation: MaterialStatePropertyAll(10),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))))),
                      onPressed: () {
                        Get.to(() => const SignUpScreen());
                      },
                      child: const Text(
                        "Register",
                        style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(176, 64, 195, 255),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ]))));
  }
}
