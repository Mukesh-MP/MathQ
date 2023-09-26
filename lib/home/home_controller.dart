import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt questionIndex = 0.obs;
  late RxList<List<int>> selectedAns = [
    [0, 0, 0, 0],
    [0, 0, 0, 0],
    [0, 0, 0, 0]
  ].obs;

  List<String> question1 = [
    "what is the name",
    "Where is the location of WorldCup Cricet?"
  ];
  List<List<String>> answers1 = [
    ["what", "is", "the", "name"],
    ["india", "america"]
  ];

  addIndex() {
    if (question1.length > questionIndex.value + 1) {
      questionIndex.value++;
    }
  }

  subIndex() {
    if (questionIndex.value > 0) {
      questionIndex.value--;
    }
  }

  radioSelection(index, value) {
    selectedAns[questionIndex.value][index] = value;
  }
}
