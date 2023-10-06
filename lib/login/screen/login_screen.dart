import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mathq/login/controller/login_controller.dart';
import 'package:mathq/login/screen/signup_screen.dart';

LinearGradient loginGradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromARGB(255, 29, 29, 39),
      Color.fromARGB(255, 29, 36, 46), // rgb(29,36,46)
      Color.fromARGB(255, 25, 48, 56) // rgb(25,48,56)
    ]);

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // var width = MediaQuery.of(context).size.width;
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
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Log in",
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          children: [
                            Text(
                              "Email",
                              style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 215, 208, 208)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          style: TextStyle(color: Colors.white),
                          controller: loginController.emailController,
                          decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(44, 255, 255, 255),
                                  )),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(143, 199, 73, 253),
                                  )),
                              contentPadding: EdgeInsets.only(left: 15),
                              filled: true,
                              fillColor: Color.fromARGB(255, 39, 42, 57),
                              hintText: "user@example.com",
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(166, 187, 185, 185)),

                              // label: Text("Username"),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              "Password",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 215, 208, 208)),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          style: TextStyle(color: Colors.white),
                          controller: loginController.passwordController,
                          decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(44, 255, 255, 255),
                                  )),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(143, 199, 73, 253),
                                  )),
                              contentPadding: EdgeInsets.only(left: 15),
                              hintText: "Password",
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(166, 187, 185, 185)),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              filled: true,
                              fillColor: Color.fromARGB(255, 39, 42, 57)),
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 45,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: ElevatedButton(
                          style: const ButtonStyle(
                              shadowColor:
                                  MaterialStatePropertyAll(Colors.black),
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.blue),
                              elevation: MaterialStatePropertyAll(10),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5))))),
                          onPressed: () {
                            loginController.login();
                          },
                          child: const Text(
                            "Log in",
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
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          "Don't  Have an account ? ",
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(
                                  255, 108, 130, 144), //rgb(108,130,144)
                              fontWeight: FontWeight.w500),
                        ),
                        GestureDetector(
                            onTap: () {
                              Get.to(() => const SignUpScreen());
                            },
                            child: Text("Create an account",
                                style: TextStyle(
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                    decorationThickness: 1.5)))
                      ],
                    ),
                  ),
                ]))));
  }
}
