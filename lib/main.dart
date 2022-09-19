import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final questions = const [
    {
      'questionText': 'What is your favourite color?',
      'answers': ['Black', 'Red', 'Green', 'White'],
    },
    {
      'questionText': 'What is your favourite animal?',
      'answers': ['Rabbit', 'Tiger', 'Lion', 'Panda'],
    },
    {
      'questionText': 'Who is you favourite singer?',
      'answers': ['Ariana Grande', 'Tylor Swift', 'Drake', 'Lepa Brena'],
    },
  ];
  @override
  var _questionindex = 0;
  void _answerQuestion() {
    setState(() {
      _questionindex = _questionindex + 1;
    });

    print(_questionindex);
    if (_questionindex < questions.length) {
      print('we have more questions');
    } else {
      print('no more questions');
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first App'),
        ),
        body: _questionindex < questions.length
            ? Column(
                children: [
                  Question(
                    questions[_questionindex]['questionText'] as String,
                  ),
                  ...(questions[_questionindex]['answers'] as List<String>)
                      .map((answer) {
                    return Answer(_answerQuestion, answer);
                  }).toList()
                ],
              )
            : Center(
                child: Text('you did it'),
              ),
      ),
    );
  }
}
