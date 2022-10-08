import 'package:flutter/material.dart';

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
    var questions = [
      'What\'s your favorite color?',
      'What\'s your favorite animal?'
    ];
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: const Text('My first App')),
      body: Column(
        children: <Widget>[
          Text(questions[_questionIndex]),
          ElevatedButton(
              onPressed: _answerQuestion, child: const Text('Answer 1')),
          ElevatedButton(
              onPressed: () => print('Answer 2 chosen'),
              child: const Text('Answer 2')),
          ElevatedButton(
              onPressed: _answerQuestion, child: const Text('Answer 3')),
        ],
      ),
    ));
  }
}
