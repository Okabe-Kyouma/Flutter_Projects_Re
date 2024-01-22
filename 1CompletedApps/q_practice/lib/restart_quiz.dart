import 'package:flutter/material.dart';
import 'package:q_practice/result_screen.dart';

class RestartQuiz extends StatelessWidget {
  const RestartQuiz(this.restartQuiz,{super.key});

  final void Function() restartQuiz;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'You have Answered X Questions Correclty Out of Y questions!!',
          style: TextStyle(color: Colors.white, fontSize: 20),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 50,
        ),
        const SizedBox(
            height: 300, child: SingleChildScrollView(child: ResultScreen())),
        const SizedBox(
          height: 50,
        ),
        OutlinedButton.icon(
            onPressed: restartQuiz,
            icon: const Icon(
              Icons.restart_alt_rounded,
              color: Colors.white,
            ),
            label: const Text(
              'Restart Quiz',
              style: TextStyle(color: Colors.white),
            )),
      ],
    );
  }
}
