import 'package:flutter/material.dart';
import './questions.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String,Object>> questions;
  final Function questionChange;
  final int questionIndex;
  final int counter;

  Quiz({
     required this.questions,
     required this.questionChange,
     required this.questionIndex,
     required this.counter
    });


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Question(
          questions[questionIndex]['questionText'] as String,
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String,Object>>)
            .map((answer) {
          return Answer(() => questionChange(answer['score']) , answer['text'] as String);
        }).toList(),
        Text(
            'Current Score: $counter',
            style: Theme.of(context).textTheme.headline6
        ),
      ],
    );
  }
}
