import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.answerList, required this.onAction});

  final List<String> answerList;
  final Function() onAction;

  List<Map<String, Object>> getSummary() {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < answerList.length; i++) {
      summary.add({
        'questionIndex': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'userAnswer': answerList[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Result Screen',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 28),
          ),
          ...getSummary()
              .map((s) => Text(((s['userAnswer'].toString())))),
          OutlinedButton(
              onPressed: () {
                onAction();
              },
              child: const Text('Restart'))
        ],
      ),
    );
  }
}
