// ignore_for_file: prefer_const_constructors, duplicate_ignore, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formkey = GlobalKey<FormState>();
  final _controller = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: AnimatedContainer(
          decoration: BoxDecoration(color: Colors.white),
          duration: Duration(milliseconds: 700),
          width: 300,
          height: 400,
          child: Card(
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    validator: (val) {
                      if (val!.contains('@')) {
                        return null;
                      } else {
                        return "Not a valid email address";
                      }
                    },
                    decoration: InputDecoration(hintText: "email"),
                    controller: _controller[0],
                  ),
                  TextFormField(
                    validator: (val) {
                      if (val!.length < 6) {
                        return "Not a valid password";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(hintText: "password"),
                    controller: _controller[1],
                  ),
                  TextFormField(
                    validator: (val) {
                      if (val!.length < 4) {
                        return "Not a valid name";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(hintText: "name"),
                    controller: _controller[2],
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: _controller[0].text,
                            password: _controller[1].text);
                      },
                      child: Text("Login")),
                  ElevatedButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          try {
                            FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: _controller[0].text,
                                    password: _controller[1].text)
                                .then((value) {
                              FirebaseAuth.instance.currentUser
                                  !.updateDisplayName(_controller[2].text);
                            });
                          } catch (error) {
                            print(error);
                          }
                        }
                      },
                      child: Text("Register")),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
