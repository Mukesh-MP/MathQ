import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mathq/home/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var homeController = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: Colors.black),
        toolbarHeight: 80,
        title: const Center(
          child: Text(
            "MathQ Question",
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 35.0,
                  bottom: 18,
                  top: 18,
                ),
                child: Obx(
                  () => Text(homeController
                      .question1[homeController.questionIndex.value]),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .6,
            child: Obx(
              () => ListView.builder(
                itemCount: homeController
                    .answers1[homeController.questionIndex.value].length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(homeController
                        .answers1[homeController.questionIndex.value][index]),
                    leading: Radio(
                      value: 0,
                      groupValue: index,
                      onChanged: (value) {},
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    homeController.subIndex();
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.arrow_back_ios),
                      Text("Previous"),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                    style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10))),
                    onPressed: () {},
                    child: const Text("Check Answer")),
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    homeController.addIndex();
                  },
                  child: const Row(
                    children: [
                      Text("Next"),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
