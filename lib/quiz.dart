import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  String activeScreen = 'start';
  List<String> selectedAnswers = [];

  void onScreenChange(String value) {
    setState(() {
      activeScreen = value;
    });
  }

  void onAnswerSelect(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result';
      });
    }
  }

  void onRestart() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'start';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget? currentScreen = StartScreen(onAction: onScreenChange);

    if (activeScreen == 'start') {
      currentScreen = StartScreen(onAction: onScreenChange);
    }
    if (activeScreen == 'quiz') {
      currentScreen = QuestionScreen(onAnswer: onAnswerSelect, onAction: onScreenChange);
    }
    if (activeScreen == 'result') {
      currentScreen = ResultScreen(onAction: onRestart, answerList: selectedAnswers);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color.fromARGB(255, 71, 127, 133), Colors.white],
                  begin: Alignment.center,
                  end: Alignment.bottomCenter)),
          child: currentScreen,
        ),
      ),
    );
  }
}
