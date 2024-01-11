import 'package:flutter/material.dart';
import 'question.dart';

void main() {
  runApp(Quizz());
}

class Quizz extends StatelessWidget {
  Quizz({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SafeArea(
      child: QuizPage(),
    ));
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreList = [];
  // List<String> questions = [
  //   'Is the sky blue?',
  //   'Was the Declaration of Independence signed in 1776?',
  //   'Did Shakespeare write "Harry Potter"?',
  //   'Is the Earth flat?',
  //   'Is Tokyo the capital of Japan?',
  // ];
  // List<bool> answers = [true, true, false, false, true];
  int i = 0;
  List<Question> questionBank = [
    Question(q: 'Is the sky blue?', a: true),
    Question(q: 'Was the Declaration of Independence signed in 1776?', a: true),
    Question(q: 'Did Shakespeare write "Harry Potter"?', a: false),
    Question(q: 'Is the Earth flat?', a: false),
    Question(q: 'Is Tokyo the capital of Japan?', a: true),
  ];
  result(bool answer) {
    var icon;
    if (i < questionBank.length) {
      if (answer == questionBank[i].answer) {
        icon = Icon(
          Icons.check,
          color: Colors.green,
        );
        i++;
      } else {
        icon = Icon(
          Icons.close,
          color: Colors.red,
        );
        i++;
      }
      scoreList.add(icon);
      print(i);
    } else {
      i = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Zax Quizz',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Color(0xff0d1117),
      body: Column(
        children: [
          // Question Placeholder
          Expanded(
            flex: 5,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              padding: EdgeInsets.all(20),
              child: Center(
                  child: Center(
                child: Text(
                  questionBank[i].question,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )),
            ),
          ),

          // Buttons
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      result(true);
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.greenAccent),
                  ),
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      result(false);
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                  ),
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),

          // Score

          Expanded(
            flex: 0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: scoreList,
            ),
          ),
        ],
      ),
    );
  }
}
