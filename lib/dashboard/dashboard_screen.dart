import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mathq/home/home_screen.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double _opacity = 0.8;
    return Scaffold(
      body: Stack(
        children: [
          // Initial opacity value

// Update the opacity value based on your animation logic

          AnimatedOpacity(
            duration:
                Duration(milliseconds: 500), // Adjust the duration as needed
            opacity: _opacity,
            child: Image.asset(
              "assets/images/dashboard.jpg",
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),

          GestureDetector(
            onTap: () {
              Get.to(() => HomeScreen());
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    "MathQ",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontSize: 25,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                              color: Color.fromARGB(255, 40, 45, 104),
                              width: 3)),
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 100,
                      child: Text(
                        "Questions",
                        style: TextStyle(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontSize: 25,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
