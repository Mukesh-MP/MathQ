import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mathq/home/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    var homeController = Get.put(HomeController());

    return Scaffold(
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
      body: Obx(
        () => homeController.isloading.value
            ? const Center(child: CircularProgressIndicator())
            : Card(
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
                    Padding(
                      padding: const EdgeInsets.only(
                            left: 30.0,
                            bottom: 18,
                            top: 15
                          ),
                      child: Row(mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              '${(homeController.questionIndex.value + 1).toString()}.'),
                          const SizedBox(
                            width: 3,
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width * .8,
                            child: Text(homeController
                                .questionsList[homeController.questionIndex.value]
                                .question,softWrap: true,
                                ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .6,
                      child:  ListView.builder(
                          itemCount: homeController.answerListAll[homeController.questionIndex.value].length,
                          itemBuilder: (context, index) {
                            return GestureDetector(onTap: () {
                              homeController.radioSelection(homeController.questionIndex.value,index);
                             // homeController.update();
                             // homeController.refresh();
                            },
                              child: ListTile(
                                title: Obx(() =>  Card(color: homeController.colorCheck(index),
                                
                                
                                    margin: const EdgeInsets.only(left: 10,right: 10),
                                    shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 15,top: 8,bottom: 8,right: 5),
                                          child: Text(index == 0 ? "A :" : index == 1 ? "B :" : index == 2 ? "C :" : index == 3 ? "D :" :  "E :"),
                                        ),
                                        const SizedBox(width: 10,),
                                        Text(homeController
                                            .answerListAll[
                                                homeController.questionIndex.value][index]
                                            .answertext),
                                      ],
                                    ),
                                  ),
                                ),
                                
                              ),
                            );
                          },
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
                              onPressed: () {
                                homeController.checkAnswer();
                              },
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
