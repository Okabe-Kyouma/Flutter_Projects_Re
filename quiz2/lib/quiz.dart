import 'package:flutter/material.dart';
import 'package:quiz2/data/questions.dart';
import 'package:quiz2/questions_screen.dart';
import 'package:quiz2/result_screen.dart';
import 'package:quiz2/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';
  List<String> selectedAnswer = [];

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);

    if (selectedAnswer.length == questions.length) {
      setState(() {
        // selectedAnswer = [];
        activeScreen = 'result-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: activeScreen == 'start-screen'
                ? StartScreen(switchScreen)
                : activeScreen == 'result-screen'
                    ? ResultScreen(
                        chosenAnswers: selectedAnswer,
                      )
                    : QuestionScreen(
                        onSelectedAnswer: chooseAnswer,
                      )),
      ),
    );
  }
}
