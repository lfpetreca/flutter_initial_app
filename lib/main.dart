import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() => runApp(InitialApp());

class InitialApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _InitialAppState();
  }
}

class _InitialAppState extends State<InitialApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    const questions = [
      {
        'questionText': 'What\'s your favorite color?',
        'answers': ['Black', 'White', 'Red', 'Green', 'Blue'],
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answers': ['Rabbit', 'Snake', 'Elephant', 'Lion', 'Rat'],
      },
      {
        'questionText': 'What\'s your favorite Magic format?',
        'answers': ['Standart', 'Pauper', 'Command', 'Other'],
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('My first App')),
        body: Column(
          children: <Widget>[
            Question(questions[_questionIndex]['questionText'] as String),
            ...(questions[_questionIndex]['answers'] as List<String>).map(
              (answer) {
                return Answer(_answerQuestion, answer);
              },
            ).toList()
          ],
        ),
      ),
    );
  }
}
