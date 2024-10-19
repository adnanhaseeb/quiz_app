//ADNAN HASEEB
//21-ARID-4017

import 'package:flutter/material.dart';
import 'package:quizapp/quizapp.dart';
import 'package:quizapp/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MySplash(title: 'Quiz App'),
    );
  }
}
