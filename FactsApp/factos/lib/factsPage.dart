// ignore_for_file: unused_import, prefer_const_constructors, duplicate_ignore, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'dart:math';

class FactsPage extends StatefulWidget {
  @override
  State<FactsPage> createState() => _FactsPageState();
}

class _FactsPageState extends State<FactsPage> {
  int factNumber = 1;

  void generateFact() {
    setState(
      () {
        factNumber = Random().nextInt(11) + 1;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        // ignore: prefer_const_constructors
        leading: Hero(
          tag: 'logo',
          child: CircleAvatar(
            backgroundImage: AssetImage('images/mscLogo.png'),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.logout,
            ),
          )
        ],
        backgroundColor: Colors.blueGrey[900],
        centerTitle: true,
        title: Text('FACTOS'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(
                  'images/fact$factNumber.jpg'), // string interpolation
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                generateFact();
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Text(
                  'Next Fact!',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
