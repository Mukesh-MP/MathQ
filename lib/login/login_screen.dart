import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mathq/login/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var loginController = Get.put(LoginController());

    return Scaffold(
        body: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                  Color.fromARGB(255, 50, 1, 48),
                  Color.fromARGB(255, 98, 7, 118),
                  Color.fromARGB(255, 135, 19, 158)
                ])),
            child: Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                                  Color.fromARGB(255, 115, 24, 132)),
                              elevation: MaterialStatePropertyAll(10),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))))),
                          onPressed: () {},
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Obx(
                    () => Visibility(
                      visible: loginController.signInOptional.value == true
                          ? true
                          : false,
                      child: const Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.purple,
                                hintText: "Username",
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)))),
                          ),
                          TextField(
                            decoration: InputDecoration(
                                hintText: "Password",
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                filled: true,
                                fillColor: Colors.purple),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * .65,
                    child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(255, 115, 24, 132)),
                          elevation: MaterialStatePropertyAll(10),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))))),
                      onPressed: () {},
                      child: const Text(
                        "Sign Up",
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
