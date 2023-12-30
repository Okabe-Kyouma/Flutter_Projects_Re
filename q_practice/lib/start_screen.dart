import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startTheQuiz, {super.key});

  final void Function() startTheQuiz;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 300,
          color: const Color.fromARGB(150, 255, 255, 255),
        ),
        const SizedBox(
          height: 80,
        ),
        const Text(
          'Learn Flutter The Fun Way!',
          style: TextStyle(
              fontSize: 24, color: Color.fromARGB(250, 255, 255, 255)),
        ),
        const SizedBox(
          height: 40,
        ),
        OutlinedButton.icon(
          onPressed: startTheQuiz,
          style: OutlinedButton.styleFrom(
              shape: const BeveledRectangleBorder(),
              side: const BorderSide(color: Color.fromARGB(10, 255, 255, 255))),
          icon: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          ),
          label: const Text(
            'Start Quiz',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
