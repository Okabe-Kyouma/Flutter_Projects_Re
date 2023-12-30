import 'package:flutter/material.dart';
import 'package:q_practice/questions_panel.dart';
import 'package:q_practice/restart_quiz.dart';
import 'package:q_practice/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _Quiz();
  }
}

class _Quiz extends State<Quiz> {
  var currentScreen = 'start-screen';

  void startQuizOnTap() {
    setState(() {
      currentScreen = 'questions-screen';
    });
  }

  void goToResultPage() {
    setState(() {
      currentScreen = 'result-screen';
    });
  }

  void reStartQuiz() {
    setState(() {
      currentScreen = 'start-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 78, 13, 151),
              Color.fromARGB(255, 107, 15, 168)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: currentScreen == 'start-screen'
              ? StartScreen(startQuizOnTap)
              : currentScreen == 'result-screen'
                  ? RestartQuiz(reStartQuiz)
                  : QuestionsPanel(goToResultPage),
        ),
      ),
    );
  }
}
