// ignore_for_file: prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables, unused_import, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:quizzy/main.dart';
import 'package:quizzy/question.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'score.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  QuestionBank question = QuestionBank();

  List<Icon> scoreKeeper = [];
  int scoreCount = 0;

  void checkAnswer(bool userpicked) {
    if (question.isFinished()) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => Score(score: scoreCount)));
      Fluttertoast.showToast(
          msg: "Score Updating",
          gravity: ToastGravity.BOTTOM,
          textColor: Colors.white);
    }

    setState(() {
      if (userpicked == question.getAnswer()) {
        scoreCount++;
        scoreKeeper.add(Icon(Icons.check, color: Colors.green));
      } else {
        scoreKeeper.add(Icon(Icons.close, color: Colors.red));
      }
      question.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Expanded(
            // ignore: prefer_const_constructors
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  question.getQuestion(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            child: TextButton(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child:
                          Text('True', style: TextStyle(color: Colors.white))),
                ),
                onPressed: () {
                  checkAnswer(true);
                },
                style: TextButton.styleFrom(backgroundColor: Colors.green)),
          ),
          Expanded(
            child: TextButton(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child:
                          Text('False', style: TextStyle(color: Colors.white))),
                ),
                onPressed: () {
                  checkAnswer(false);
                },
                style: TextButton.styleFrom(backgroundColor: Colors.red)),
          ),
          Row(
            children: scoreKeeper,
          )
        ],
      ),
    );
  }
}
