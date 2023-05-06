// ignore_for_file: prefer_const_constructors, duplicate_ignore, unused_import, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Xylophone',
      home: Xylophone(),
    );
  }
}

class Xylophone extends StatelessWidget {
  void playSound(int n) {
    final player = AudioCache();
    player.play('note$n.wav');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          xylokey(1, Colors.red),
          xylokey(2, Colors.blue),
          xylokey(3, Colors.green),
          xylokey(4, Colors.yellow),
          xylokey(5, Colors.white),
          xylokey(6, Colors.black),
          xylokey(7, Colors.purple),
        ],
      ),
    );
  }

  Expanded xylokey(int soundNumber, Color color) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          playSound(soundNumber);
        },
        child: Container(
          color: color,
        ),
      ),
    );
  }
}
