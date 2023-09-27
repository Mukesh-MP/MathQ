import 'package:get/get.dart';
import 'package:mathq/widgets/toast.dart';
import 'package:sqflite/sqflite.dart';
import 'package:mathq/widgets/log.dart';
import 'package:path/path.dart';

class HomeController extends GetxController {
  List<Questions> questionsList = [];
  List<Answers> answersList = [];
  RxInt questionIndex = 0.obs;
  late RxList<List> selectedAns = [[], [], []].obs;
  RxBool isloading = false.obs;

  // List<String> question1 = [
  //   "what is the name",
  //   "Where is the location of WorldCup Cricet?"
  // ];
  List<List<String>> answers1 = [
    ["what", "is", "the", "name"],
    ["india", "america"]
  ];

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

  radioSelection(index, value) {
    selectedAns[questionIndex.value][index] = value;
  }

  createDataBase() async {
    isloading.value = true;
    deleteDatabase(await getDatabasesPath());
    final database = openDatabase(
        join(
          await getDatabasesPath(),
          'master.db',
        ), onCreate: (db, version) async {
      Batch batch = db.batch();
      batch.execute('DROP TABLE IF EXISTS answers ');
      batch.execute('DROP TABLE IF EXISTS questions ');
      batch.execute(
          'CREATE TABLE questions (qid INTEGER PRIMARY KEY, question TEXT)');
      batch.execute(
          'CREATE TABLE answers (answerid INTEGER PRIMARY KEY, answertext TEXT,qid INTEGER, correct TEXT)');
      // await db.execute(
      //     'CREATE TABLE questions (qid INTEGER PRIMARY KEY, question TEXT)');
      // await db.execute(
      //     'CREATE TABLE answers (answerid INTEGER PRIMARY KEY, answertext TEXT,qid INTEGER, correct TEXT)');
      // CustomLog.customprint("tablecreated.....");
      List<dynamic> result = await batch.commit();
      CustomLog.customprint(result.toString());
    }, version: 2);

    CustomLog.customprint(database.toString());

    // Define a function that inserts dogs into the database
    Future<void> insertQuestions(Questions questionsall) async {
      // Get a reference to the database.
      final db = await database;

      // Insert the Dog into the correct table. You might also specify the
      // `conflictAlgorithm` to use in case the same dog is inserted twice.
      //
      // In this case, replace any previous data.
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

    // Create a Dog and add it to the dogs table
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

    // A method that retrieves all the dogs from the dogs table.
    Future<List<Questions>> retrieveQuestions() async {
      // Get a reference to the database.
      final db = await database;

      // Query the table for all The Dogs.
      final List<Map<String, dynamic>> maps = await db.query('questions');

      // Convert the List<Map<String, dynamic> into a List<Dog>.
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

      // Insert the Dog into the correct table. You might also specify the
      // `conflictAlgorithm` to use in case the same dog is inserted twice.
      //
      // In this case, replace any previous data.
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
        const Answers(answerid: 1, answertext: "0.06", qid: 2, correct: 'Y');
    var answer2 =
        const Answers(answerid: 2, answertext: "0.6", qid: 2, correct: 'N');
    var answer3 =
        const Answers(answerid: 3, answertext: "0.006", qid: 2, correct: 'N');
    var answer4 =
        const Answers(answerid: 4, answertext: "0.0006", qid: 2, correct: 'N');

    var answer5 =
        const Answers(answerid: 5, answertext: "34 * 67", qid: 1, correct: 'N');
    var answer6 = const Answers(
        answerid: 6, answertext: "58(34+9)", qid: 1, correct: 'Y');
    var answer7 = const Answers(
        answerid: 7, answertext: "34 * 58 + 34 * 9", qid: 1, correct: 'N');
    var answer8 = const Answers(
        answerid: 8, answertext: "1,972 + 306", qid: 1, correct: 'N');
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

      // Query the table for all The Dogs.
      final List<Map<String, dynamic>> maps = await db.query('answers');

      // Convert the List<Map<String, dynamic> into a List<Dog>.
      return List.generate(maps.length, (i) {
        return Answers(
          answerid: maps[i]['answerid'],
          answertext: maps[i]['answertext'],
          qid: maps[i]['qid'],
          correct: maps[i]['correct'],
        );
      });
    }

    answersList = await retrieveAnswers();
    CustomLog.customprint(answersList.toString());
    isloading.value = false;
  }
}

class Questions {
  final int qid;
  final String question;

  const Questions({
    required this.qid,
    required this.question,
  });

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'qid': qid,
      'question': question,
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
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

  const Answers(
      {required this.answerid,
      required this.answertext,
      required this.qid,
      this.correct = 'N'});

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'answerid': answerid,
      'answertext': answertext,
      'qid': qid,
      'correct': correct
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Questions{answerid: $answerid, answertext: $answertext,qid: $qid, correct: $correct}';
  }
}
