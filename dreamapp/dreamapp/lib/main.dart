// ignore_for_file: prefer_const_constructors, duplicate_ignore, use_key_in_widget_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(DreamApp()); // runApp(widget_name)
}

class DreamApp extends StatelessWidget {
  @override //changes limited to this MyApp class only
  Widget build(
      BuildContext context) // returntype funcName (returntype parameter)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey, // or Color(hexcode),
          centerTitle: true,
          title: (Text('Dream App')),
        ),
        // ignore: prefer_const_constructors
        body: Center(
          // ignore: prefer_const_constructors
          child: Image(
            image: AssetImage(
                'images/GamingSetup.jpg'), // NetworkImage and AssetImage
          ),
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}
