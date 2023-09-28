

import 'package:get/get.dart';
import 'package:mathq/widgets/toast.dart';
import 'package:sqflite/sqflite.dart';
import 'package:mathq/widgets/log.dart';
import 'package:path/path.dart';

class HomeController extends GetxController {
  
  List<Questions> questionsList = [];
  List<Answers> answersList = [];
  RxInt questionIndex = 0.obs;

  RxBool isloading = false.obs;

  RxList<RxList<Answers>> answerListAll = [[Answers(answerid: -1, answertext: "", qid: -1,userselected: "".obs)].obs].obs;
  RxList<Answers> quest = [Answers(answerid: -1, answertext: "", qid: -1,userselected: "".obs)].obs;
  RxList<RxList<Answers>> questAll = [[Answers(answerid: -1, answertext: "", qid: -1,userselected: "".obs)].obs].obs;
  

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
    } else {
      answerListAll[questionIndex][i].userselected.value = "N";
    }
  }
}





  void _onUpgrade(Database db, int oldVersion, int newVersion) {
    if (oldVersion < newVersion) {
      db.execute("ALTER TABLE answers ADD COLUMN userselected TEXT;");
    }
  }
  createDataBase() async {
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
          'CREATE TABLE questions (qid INTEGER PRIMARY KEY, question TEXT)');
      batch.execute(
          'CREATE TABLE answers (answerid INTEGER PRIMARY KEY, answertext TEXT,qid INTEGER, correct TEXT)');
      // await db.execute(
      //     'CREATE TABLE questions (qid INTEGER PRIMARY KEY, question TEXT)');
      // await db.execute(
      //     'CREATE TABLE answers (answerid INTEGER PRIMARY KEY, answertext TEXT,qid INTEGER, correct TEXT)');
      
      List<dynamic> result = await batch.commit();
      CustomLog.customprint(result.toString());
      final tables = db.rawQuery('SELECT * FROM sqlite_master ORDER BY name;');
      CustomLog.customprint(tables.toString());
    },onUpgrade: _onUpgrade,
     version: 5);
    
    CustomLog.customprint(database.toString());

    // Define a function that inserts dogs into the database
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
        showToast(msg: "Question Fetch Error");
        isloading.value = false;
      }
    }

    var quesion1 = const Questions(
      qid: 1,
      question: 'Which of the following values is NOT equal to 34(58+9)?',
    );
    var quesion2 = const Questions(
      qid: 2,
      question: 'What is 6% Equals to',
    );

    try {
      await insertQuestions(quesion1);
      await insertQuestions(quesion2);
    } catch (e) {
      showToast(msg: "Question fetching failed");
      // isloading.value = false;
    }

    Future<List<Questions>> retrieveQuestions() async {
      // Get a reference to the database.
      final db = await database;

      final List<Map<String, dynamic>> maps = await db.query('questions');

      return List.generate(maps.length, (i) {
        return Questions(
          qid: maps[i]['qid'],
          question: maps[i]['question'],
        );
      });
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
        showToast(msg: "answer fetching failed");
        //  isloading.value = false;
      }
    }

    var answer1 =
         Answers(answerid: 1, answertext: "0.06", qid: 2, correct: 'Y',userselected: 'N'.obs);
    var answer2 =
         Answers(answerid: 2, answertext: "0.6", qid: 2, correct: 'N',userselected: 'N'.obs);
    var answer3 =
         Answers(answerid: 3, answertext: "0.006", qid: 2, correct: 'N',userselected: 'N'.obs);
    var answer4 =
         Answers(answerid: 4, answertext: "0.0006", qid: 2, correct: 'N',userselected: 'N'.obs);

    var answer5 =
         Answers(answerid: 5, answertext: "34 * 67", qid: 1, correct: 'N',userselected: 'N'.obs);
    var answer6 =  Answers(
        answerid: 6, answertext: "58(34+9)", qid: 1, correct: 'Y',userselected: 'N'.obs);
    var answer7 =  Answers(
        answerid: 7, answertext: "34 * 58 + 34 * 9", qid: 1, correct: 'N',userselected: 'N'.obs);
    var answer8 =  Answers(
        answerid: 8, answertext: "1,972 + 306", qid: 1, correct: 'N',userselected: 'N'.obs);
    try {
      await insertAnswers(answer1);
      await insertAnswers(answer2);
      await insertAnswers(answer3);
      await insertAnswers(answer4);
      await insertAnswers(answer5);
      await insertAnswers(answer6);
      await insertAnswers(answer7);
      await insertAnswers(answer8);
    } catch (e) {
      showToast(msg: "Answer fetch error");
      // isloading.value = false;
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
  }

  Future<RxList<RxList<Answers>>> answerLoop() async {
  


    for (var k = 0; k < questionsList.length; k++) {
      for (var i = 0; i < answersList.length; i++) {
        quest.value = answersList.where((element) => element.qid == (k + 1)).toList();
      }
      
      questAll.add(quest);
    }
    return questAll;
  }
}

class Questions {
  final int qid;
  final String question;

  const Questions({
    required this.qid,
    required this.question,
  });

  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'qid': qid,
      'question': question,
    };
  }

  // Implement toString to make it easier to see information about
  @override
  String toString() {
    return 'Questions{qid: $qid, question: $question}';
  }
}

class Answers {
  final int answerid;
  final String answertext;
  final int qid;
  final String correct;
  RxString userselected  = 'N'.obs;

   Answers(
      {required this.answerid,
      required this.answertext,
      required this.qid,
      this.correct = 'N',
      required this.userselected,});

  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'answerid': answerid,
      'answertext': answertext,
      'qid': qid,
      'correct': correct,
      'userselected':userselected.value

    };
  }

  // Implement toString to make it easier to see information about
  @override
  String toString() {
    return 'Questions{answerid: $answerid, answertext: $answertext,qid: $qid, correct: $correct,userselected : $userselected}';
  }
}
