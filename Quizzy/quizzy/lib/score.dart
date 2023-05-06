// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, duplicate_ignore, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  int score = 0;
  Score({required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_constructors
            children: <Widget>[
              // ignore: prefer_const_constructors
              Text(
                'Your Score is: ',
                style: TextStyle(fontSize: 40, color: Colors.orange),
              ),
              Text(
                score.toString(),
                style: TextStyle(fontSize: 50, color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
