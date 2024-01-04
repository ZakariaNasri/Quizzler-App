import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  @override
  List<Icon> ScoreList = [];

  result(bool answer) {
    var icon;
    if (answer == true) {
      icon = Icon(
        Icons.check,
        color: Colors.green,
      );
    } else {
      icon = Icon(
        Icons.close,
        color: Colors.red,
      );
    }
    ScoreList.add(icon);
  }

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
                  'Here is thequestion placeholder',
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
              children: ScoreList,
            ),
          ),
        ],
      ),
    );
  }
}
