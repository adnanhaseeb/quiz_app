//ADNAN HASEEB
//21-ARID-4017

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/questionbank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuestionBank QA = QuestionBank();
int correct_answers = 0;
int wrong_answers = 0;

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  bool _isQuizFinished = false;
  @override
  void _CheckQuestion(bool UserAnswer) {
    if (QA.Finish() == true) {
      if (QA.GetAnswer() == UserAnswer) {
        CustomIcons.add(Icon(
          Icons.check,
          color: Colors.green,
          size: 50,
        ));
        correct_answers++;
      } else {
        CustomIcons.add(Icon(
          Icons.close,
          color: Colors.red,
          size: 50,
        ));
        wrong_answers++;
      }
      _isQuizFinished = true;
      Future.delayed(Duration(seconds: 1), () {
        Alert(
          context: context,
          title: 'Finish Quiz',
          desc:
              'QUIZ ENDED!!\n\nCorrect Answers: $correct_answers\nWrong Answers: $wrong_answers',
        ).show().then((value) {
          // This will be called after the Alert dialog is dismissed
          setState(() {
            _isQuizFinished = false;
            correct_answers = 0;
            wrong_answers = 0;
            CustomIcons = [];
            QA.Reset();
          });
        });
        QA.Reset();
        CustomIcons = [];
      });
    } else {
      if (QA.GetAnswer() == UserAnswer) {
        CustomIcons.add(Icon(
          Icons.check,
          color: Colors.green,
          size: 50,
        ));
        correct_answers++;
      } else {
        CustomIcons.add(Icon(
          Icons.close,
          color: Colors.red,
          size: 50,
        ));
        wrong_answers++;
      }
      QA.nextQuestion();
    }
  }

  List<Icon> CustomIcons = [];
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                QA.GetQuestion()!,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: _isQuizFinished
                      ? null
                      : () {
                          _CheckQuestion(true);
                          setState(() {});
                        },
                  child: Text(
                    'TRUE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              SizedBox(
                height: 5,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: _isQuizFinished
                    ? null
                    : () {
                        _CheckQuestion(false);
                        setState(() {});
                      },
                child: Text(
                  'FALSE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: CustomIcons,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
