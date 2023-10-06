import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mathq/login/controller/login_controller.dart';

LinearGradient signupGradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromARGB(255, 29, 29, 39),
      Color.fromARGB(255, 29, 36, 46), // rgb(29,36,46)
      Color.fromARGB(255, 25, 48, 56)
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
          shadowColor: const Color.fromARGB(255, 29, 29, 39),
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 29, 29, 39),
        ),
        body: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              gradient: signupGradient,
            ),
            child: Center(
                child: SizedBox(
              width: width * .8,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "SignUp",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        Text(
                          "Email",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 215, 208, 208)),
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
                      height: 5,
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
                    ),
                    Row(
                      children: [
                        Text(
                          "Confirm Password",
                          style: TextStyle(
                              color: Color.fromARGB(255, 215, 208, 208)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextField(
                      style: TextStyle(color: Colors.white),
                      controller: loginController.confirmPasswordController,
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
                          hintText: "Confirm Password",
                          hintStyle: TextStyle(
                              color: Color.fromARGB(166, 187, 185, 185)),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          filled: true,
                          fillColor: Color.fromARGB(255, 39, 42, 57)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 45,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.blue),
                            elevation: MaterialStatePropertyAll(10),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))))),
                        onPressed: () {
                          loginController.signUpSubmit();
                        },
                        child: const Text(
                          "Submit",
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(226, 255, 255, 255),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ]),
            ))));
  }
}
