import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quiz_app/quiz.dart';

class QuizQuestion {
  QuizQuestion(this.question, this.answers);

  final String question;
  final List<String> answers;

  List<String> getRandomAnswers() {
    final randomAnswers = List.of(answers);
    randomAnswers.shuffle();
    return randomAnswers;
  }
  Future<Map<String,Object>> readJson() async {
    
    final String response = await rootBundle.loadString('assets/json/question.json');
    final data = await json.decode(response);
    final question = data['question'];
    final answers = data[''];
    
  }
}
