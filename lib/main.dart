import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(const InitialApp());

class InitialApp extends StatefulWidget {
  const InitialApp({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _InitialAppState();
  }
}

class _InitialAppState extends State<InitialApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'White', 'score': 8},
        {'text': 'Red', 'score': 7},
        {'text': 'Green', 'score': 6},
        {'text': 'Blue', 'score': 9},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 5},
        {'text': 'Snake', 'score': 7},
        {'text': 'Elephant', 'score': 9},
        {'text': 'Lion', 'score': 8},
        {'text': 'Rat', 'score': 6},
      ],
    },
    {
      'questionText': 'What\'s your favorite Magic format?',
      'answers': [
        {'text': 'Standart', 'score': 10},
        {'text': 'Pauper', 'score': 9},
        {'text': 'Command', 'score': 8},
        {'text': 'Other', 'score': 5},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('My first App')),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(resultScore: _totalScore, resetQuiz: _resetQuiz),
      ),
    );
  }
}
