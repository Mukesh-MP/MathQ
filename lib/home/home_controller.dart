import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mathq/config/shared_preferences.dart';
import 'package:mathq/widgets/error_widget.dart';
import 'package:mathq/widgets/toast.dart';
import 'package:sqflite/sqflite.dart';
import 'package:mathq/widgets/log.dart';
import 'package:path/path.dart';

class HomeController extends GetxController {
  bool intialValue = true;

  List<Questions> questionsList = [];
  List<Answers> answersList = [];
  RxInt questionIndex = 0.obs;
  RxInt correctAnswerIndex = 0.obs;

  RxBool isloading = false.obs;

  RxList<RxList<Answers>> answerListAll = [
    [Answers(answerid: -1, answertext: "", qid: -1, userselected: "".obs)].obs
  ].obs;
  RxList<Answers> quest = [
    Answers(answerid: -1, answertext: "", qid: -1, userselected: "".obs)
  ].obs;
  RxList<RxList<Answers>> questAll = [
    [Answers(answerid: -1, answertext: "", qid: -1, userselected: "".obs)].obs
  ].obs;
  RxList<Answers> copyQuest = [
    Answers(answerid: -1, answertext: "", qid: -1, userselected: "".obs)
  ].obs;

  @override
  void onInit() {
    super.onInit;
    try {
      createDataBase();
    } catch (e) {
      CustomLog.customprint(e.toString());
    }
  }

  addIndex() {
    if (questionsList.length > questionIndex.value + 1) {
      questionIndex.value++;
    }
  }

  subIndex() {
    if (questionIndex.value > 0) {
      questionIndex.value--;
    }
  }

  // radioSelection(index) {
  //   answerListAll[questionIndex.value][index].userselected.value = "Y";
  //   for (var i = 0; i < answerListAll[questionIndex.value].length; i++) {
  //     if (i != index) {
  //       answerListAll[questionIndex.value][i].userselected.value = "N";
  //     }
  //   }
  // }

  radioSelection(questionIndex, answerIndex) {
    // Set the selected answer to "Y" and others to "N" for the specified question and answer
    for (var i = 0; i < answerListAll[questionIndex].length; i++) {
      if (i == answerIndex) {
        answerListAll[questionIndex][i].userselected.value = "Y";
        questionsList[questionIndex].checked.value = 0;
      } else {
        answerListAll[questionIndex][i].userselected.value = "N";
      }
    }
  }

  validationNext(questionIndex) {
    var contain = answerListAll[questionIndex]
        .where((element) => element.userselected == 'Y');
    if (contain.isEmpty) {
      showToast(
          msg: "Please select an answer",
          backgroundColor: const Color.fromARGB(255, 2, 34, 61),
          textColor: Colors.white);
    } else {
      checkAnswer();
    }
  }

  checkAnswer() {
    var list1 = answerListAll[questionIndex.value];

    var correctIndex = list1.indexWhere((element) => element.correct == "Y");
    var selectedIndex =
        list1.indexWhere((element) => element.userselected.value == "Y");
    if (correctIndex == selectedIndex) {
      questionsList[questionIndex.value].checked.value = 1;
      showToast(msg: "Correct Answer", backgroundColor: Colors.green.shade500);
      Future.delayed(
        Duration(seconds: 2),
        () {
          addIndex();
        },
      );
    } else {
      questionsList[questionIndex.value].checked.value = 1;
      showToast(msg: "Incorrect Answer", backgroundColor: Colors.red.shade500);
    }

    CustomLog.customprint("correctIndexis :$correctIndex");
    CustomLog.customprint("selectedIndexis :$selectedIndex");
  }

  Color colorCheck(index) {
    if (answerListAll[questionIndex.value][index].userselected.value == "Y" &&
        answerListAll[questionIndex.value][index].correct == "Y" &&
        questionsList[questionIndex.value].checked.value == 1) {
      return Colors.green;
    } else if (answerListAll[questionIndex.value][index].userselected.value ==
        "Y") {
      return const Color.fromARGB(255, 249, 240, 58);
    } else {
      return Colors.grey.shade200;
    }
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) {
    if (oldVersion < newVersion) {
      // db.execute('ALTER TABLE questions ADD COLUMN checked INTEGER');
      // db.execute(
      //     'CREATE TABLE globalsettings (settingsId INTEGER PRIMARY KEY, settingsName VARCHAR, settingsValue VARCHAR');
      // db.execute(
      //     'INSERT INTO globalsettings (settingsId, settingsName, settingsValue) VALUES (1, "initall_insert", "Y")');
    }
  }

  createDataBase() async {
    intialValue = await SecureStorage().initialValue;
    isloading.value = true;
    //  deleteDatabase(await getDatabasesPath());
    final database = openDatabase(
        join(
          await getDatabasesPath(),
          'mast.db',
        ), onCreate: (db, version) async {
      Batch batch = db.batch();
      // batch.execute('DROP TABLE IF EXISTS answers ');
      // batch.execute('DROP TABLE IF EXISTS questions ');
      batch.execute(
          'CREATE TABLE questions (qid INTEGER PRIMARY KEY, question TEXT, checked INTEGER)');
      batch.execute(
          'CREATE TABLE answers (answerid INTEGER PRIMARY KEY, answertext TEXT,qid INTEGER, correct TEXT,userselected TEXT)');
      // await db.execute(
      //     'CREATE TABLE questions (qid INTEGER PRIMARY KEY, question TEXT)');
      // await db.execute(
      //     'CREATE TABLE answers (answerid INTEGER PRIMARY KEY, answertext TEXT,qid INTEGER, correct TEXT)');

      List<dynamic> result = await batch.commit();
      CustomLog.customprint(result.toString());
      final tables = db.rawQuery('SELECT * FROM sqlite_master ORDER BY name;');
      CustomLog.customprint(tables.toString());
    }, onUpgrade: _onUpgrade, version: 8);

    CustomLog.customprint(database.toString());

    // Future<List<Settings>> retrieveSettings() async {
    //   // Get a reference to the database.
    //   final db = await database;

    //   final List<Map<String, dynamic>> maps = await db.query('globalsettings');

    //   return List.generate(maps.length, (i) {
    //     return Settings(
    //       settingsId: maps[i]['settingsId'],
    //       settingsName: maps[i]['settingsName'],
    //       settingsValue: maps[i]['settingsValue'],
    //     );
    //   });
    // }

    Future<List<Questions>> retrieveQuestions() async {
      // Get a reference to the database.
      final db = await database;

      final List<Map<String, dynamic>> maps = await db.query('questions');

      return List.generate(maps.length, (i) {
        RxInt checked = RxInt(maps[i]['checked']);
        return Questions(
          qid: maps[i]['qid'],
          question: maps[i]['question'],
          checked: checked,
        );
      });
    }

    // List<Questions> questionisAvailable = await retrieveQuestions();

    // Define a function that inserts dogs into the database

    // if (questionisAvailable.isNotEmpty) {
    //   final db = await database;
    //   Map<String, dynamic> data = {'settingsValue': 'N'};
    //   try {
    //     db.update("globalsettings", data, where: '"settingsId" = 1');
    //   } catch (e) {
    //     showToast(msg: "updateError");
    //   }
    // }

    Future<void> insertQuestions(Questions questionsall) async {
      // Get a reference to the database.
      final db = await database;

      try {
        await db.insert(
          'questions',
          questionsall.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      } catch (e) {
        Get.to(() => ErrorWidgetMathQ(errorMsg: "Question Insert Error"));
        isloading.value = false;
      }
    }

    //  List<Settings> settingsAll = await retrieveSettings();

    var quesion1 = Questions(
        qid: 1,
        question: 'Which of the following values is NOT equal to 34(58+9)?',
        checked: 0.obs);
    var quesion2 =
        Questions(qid: 2, question: 'What is 6% Equals to', checked: 0.obs);
    var quesion3 = Questions(
        qid: 3,
        question: 'How Many Years are there in a Decade?',
        checked: 0.obs);
    var quesion4 = Questions(
        qid: 4, question: 'How Many Months Make a Century?', checked: 0.obs);
    var quesion5 = Questions(
        qid: 5,
        question:
            'Priya had 16 Red Balls, 2 Green Balls, 9  Blue Balls, and 1 Multicolor Ball. If He Lost 9 Red Balls, 1 Green Ball, and 3 Blue Balls. How Many Balls would be Left?',
        checked: 0.obs);
    if (intialValue) {
      try {
        await insertQuestions(quesion1);
        await insertQuestions(quesion2);
        await insertQuestions(quesion3);
        await insertQuestions(quesion4);
        await insertQuestions(quesion5);
      } catch (e) {
        showToast(msg: "Question fetching failed");
        // isloading.value = false;
      }
    }

    questionsList = await retrieveQuestions();
    CustomLog.customprint(questionsList.toString());

    Future<void> insertAnswers(Answers answersAll) async {
      // Get a reference to the database.
      final db = await database;

      try {
        db.insert(
          'answers',
          answersAll.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      } catch (e) {
        Get.to(() => ErrorWidgetMathQ(errorMsg: "answer insert failed"));
      }
    }

    var answer1 = Answers(
        answerid: 1,
        answertext: "0.06",
        qid: 2,
        correct: 'Y',
        userselected: 'N'.obs);
    var answer2 = Answers(
        answerid: 2,
        answertext: "0.6",
        qid: 2,
        correct: 'N',
        userselected: 'N'.obs);
    var answer3 = Answers(
        answerid: 3,
        answertext: "0.006",
        qid: 2,
        correct: 'N',
        userselected: 'N'.obs);
    var answer4 = Answers(
        answerid: 4,
        answertext: "0.0006",
        qid: 2,
        correct: 'N',
        userselected: 'N'.obs);

    var answer5 = Answers(
        answerid: 5,
        answertext: "34 * 67",
        qid: 1,
        correct: 'N',
        userselected: 'N'.obs);
    var answer6 = Answers(
        answerid: 6,
        answertext: "58(34+9)",
        qid: 1,
        correct: 'Y',
        userselected: 'N'.obs);
    var answer7 = Answers(
        answerid: 7,
        answertext: "34 * 58 + 34 * 9",
        qid: 1,
        correct: 'N',
        userselected: 'N'.obs);
    var answer8 = Answers(
        answerid: 8,
        answertext: "1,972 + 306",
        qid: 1,
        correct: 'N',
        userselected: 'N'.obs);

    var answer9 = Answers(
        answerid: 9,
        answertext: "5 Years",
        qid: 3,
        correct: 'N',
        userselected: 'N'.obs);
    var answer10 = Answers(
        answerid: 10,
        answertext: "10 Years",
        qid: 3,
        correct: 'Y',
        userselected: 'N'.obs);
    var answer11 = Answers(
        answerid: 11,
        answertext: "15 Years",
        qid: 3,
        correct: 'N',
        userselected: 'N'.obs);
    var answer12 = Answers(
        answerid: 12,
        answertext: "20 Years",
        qid: 3,
        correct: 'N',
        userselected: 'N'.obs);

    var answer13 = Answers(
        answerid: 13,
        answertext: "12",
        qid: 4,
        correct: 'N',
        userselected: 'N'.obs);
    var answer14 = Answers(
        answerid: 14,
        answertext: "120",
        qid: 4,
        correct: 'N',
        userselected: 'N'.obs);
    var answer15 = Answers(
        answerid: 15,
        answertext: "1200",
        qid: 4,
        correct: 'Y',
        userselected: 'N'.obs);
    var answer16 = Answers(
        answerid: 16,
        answertext: "12000",
        qid: 4,
        correct: 'N',
        userselected: 'N'.obs);

    var answer17 = Answers(
        answerid: 17,
        answertext: "15",
        qid: 5,
        correct: 'Y',
        userselected: 'N'.obs);
    var answer18 = Answers(
        answerid: 18,
        answertext: "11",
        qid: 5,
        correct: 'N',
        userselected: 'N'.obs);
    var answer19 = Answers(
        answerid: 19,
        answertext: "28",
        qid: 5,
        correct: 'N',
        userselected: 'N'.obs);
    var answer20 = Answers(
        answerid: 20,
        answertext: "39",
        qid: 5,
        correct: 'N',
        userselected: 'N'.obs);
    if (intialValue) {
      try {
        await insertAnswers(answer1);
        await insertAnswers(answer2);
        await insertAnswers(answer3);
        await insertAnswers(answer4);
        await insertAnswers(answer5);
        await insertAnswers(answer6);
        await insertAnswers(answer7);
        await insertAnswers(answer8);
        await insertAnswers(answer9);
        await insertAnswers(answer10);
        await insertAnswers(answer11);
        await insertAnswers(answer12);
        await insertAnswers(answer13);
        await insertAnswers(answer14);
        await insertAnswers(answer15);
        await insertAnswers(answer16);
        await insertAnswers(answer17);
        await insertAnswers(answer18);
        await insertAnswers(answer19);
        await insertAnswers(answer20);
      } catch (e) {
        showToast(msg: "Answer fetch error");
        // isloading.value = false;
      }
    }
    Future<List<Answers>> retrieveAnswers() async {
      // Get a reference to the database.
      final db = await database;

      final List<Map<String, dynamic>> maps = await db.query('answers');

      return List.generate(maps.length, (i) {
        RxString userSelected = RxString(maps[i]['userselected']);
        return Answers(
          answerid: maps[i]['answerid'],
          answertext: maps[i]['answertext'],
          qid: maps[i]['qid'],
          correct: maps[i]['correct'],
          userselected: userSelected,
        );
      });
    }

    answersList = await retrieveAnswers();
    CustomLog.customprint(answersList.toString());
    questAll.clear();
    answerListAll.value = await answerLoop();
    CustomLog.customprint(answerListAll.toString());
    isloading.value = false;
    SecureStorage().initialValue = false;
  }

  Future<RxList<RxList<Answers>>> answerLoop() async {
    for (var k = 0; k < questionsList.length; k++) {
      for (var i = 0; i < answersList.length; i++) {
        quest.value =
            answersList.where((element) => element.qid == (k + 1)).toList();
      }
      //  copyQuest.value = List.from(quest);

      questAll.add(RxList.from(quest));
    }
    return questAll;
  }
}

class Settings {
  final int settingsId;
  final String settingsName;
  final String settingsValue;

  Settings({
    required this.settingsId,
    required this.settingsName,
    required this.settingsValue,
  });

  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'settingsId': settingsId,
      'settingsName': settingsName,
      'settingsValue': settingsValue
    };
  }

  // Implement toString to make it easier to see information about
  @override
  String toString() {
    return 'Settings{settingsId: $settingsId, settingsName: $settingsName,settingsValue: $settingsValue}';
  }
}

class Questions {
  final int qid;
  final String question;
  RxInt checked = 0.obs;

  Questions({
    required this.qid,
    required this.question,
    required this.checked,
  });

  // columns in the database.
  Map<String, dynamic> toMap() {
    return {'qid': qid, 'question': question, 'checked': checked.value};
  }

  // Implement toString to make it easier to see information about
  @override
  String toString() {
    return 'Questions{qid: $qid, question: $question,checked: $checked}';
  }
}

class Answers {
  final int answerid;
  final String answertext;
  final int qid;
  final String correct;
  RxString userselected = 'N'.obs;

  Answers({
    required this.answerid,
    required this.answertext,
    required this.qid,
    this.correct = 'N',
    required this.userselected,
  });

  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'answerid': answerid,
      'answertext': answertext,
      'qid': qid,
      'correct': correct,
      'userselected': userselected.value
    };
  }

  // Implement toString to make it easier to see information about
  @override
  String toString() {
    return 'Questions{answerid: $answerid, answertext: $answertext,qid: $qid, correct: $correct,userselected : $userselected}';
  }
}
