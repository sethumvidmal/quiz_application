import 'package:flutter/material.dart';

class QuestionResult extends StatelessWidget {
  const QuestionResult({super.key, required this.value});

  final Map<String, Object> value;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // SizedBox(height: 20,),
        Text(
            'Question ${(value['questionIndex'] as int) + 1} : ${value['question'].toString()}',
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center),
        Text('Your answer : ${((value['userAnswer'].toString()))}',
            style: TextStyle(
                fontSize: 20,
                color: value['userAnswer'].toString() ==
                        value['correct_answer'].toString()
                    ? Colors.green
                    : Colors.red),
            textAlign: TextAlign.center),
        Text('Correct answer : ${value['correct_answer'].toString()}',
            style: const TextStyle(fontSize: 20, color: Colors.blue),
            textAlign: TextAlign.center)
      ],
    ),
    );
  }
}
