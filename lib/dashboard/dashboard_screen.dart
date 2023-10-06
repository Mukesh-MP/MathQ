import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mathq/home/home_screen.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
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
            child: Center(
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(color: Color.fromARGB(255, 1, 9, 92))),
                width: 150,
                height: 100,
                child: Text(
                  "Questions",
                  style: TextStyle(color: Colors.blueGrey, fontSize: 20),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
