import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mathq/home/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var homeController = Get.put(HomeController());

    return Obx(
      () => homeController.isloading.value
          ? const CircularProgressIndicator(
              color: Colors.purple,
            )
          : Scaffold(
              backgroundColor: Colors.white,
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
              body: Card(
                color: const Color.fromARGB(255, 244, 242, 242),
                elevation: 0,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
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
                                .questionsList[
                                    homeController.questionIndex.value]
                                .question),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .6,
                      child: Obx(
                        () => ListView.builder(
                          itemCount: homeController
                              .answers1[homeController.questionIndex.value]
                              .length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(homeController.answers1[
                                  homeController.questionIndex.value][index]),
                              leading: Radio(
                                value: 0,
                                groupValue: 1,
                                onChanged: (value) {
                                  homeController.radioSelection(index, value);
                                },
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
                                  padding: MaterialStatePropertyAll(
                                      EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                          top: 10,
                                          bottom: 10))),
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
              ),
            ),
    );
  }
}
