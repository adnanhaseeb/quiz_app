//ADNAN HASEEB
//21-ARID-4017

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quizapp/quizapp.dart';

class MySplash extends StatefulWidget {
  const MySplash({super.key, required String title});

  @override
  State<MySplash> createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 15), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => QuizApp()));
    });
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            color: Colors.blueGrey,
            width: size.width,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 130,
                  backgroundImage: AssetImage('assets/Quiz.jpeg'),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Quiz App",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "The Ultimate Test of Knowledge!",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CircularProgressIndicator(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
