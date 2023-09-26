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
    var width = MediaQuery.of(context).size.width;
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
                    child: const TextField(
                      decoration: InputDecoration(
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
                          fillColor: Color.fromARGB(255, 135, 48, 151),
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
                    child: const TextField(
                      decoration: InputDecoration(
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
                          fillColor: Color.fromARGB(255, 135, 48, 151)),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: width * .65,
                    child: const TextField(
                      decoration: InputDecoration(
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
                          fillColor: Color.fromARGB(255, 135, 48, 151)),
                    ),
                  )
                ]))));
  }
}
