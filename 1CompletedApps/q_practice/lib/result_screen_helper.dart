import 'package:flutter/material.dart';

class ResultScreenHelper extends StatelessWidget {
  const ResultScreenHelper(
      {super.key,
      required this.question,
      required this.chosenAnswer,
      required this.correctAnswer,
      required this.index});

  final String index;
  final String question;
  final String chosenAnswer;
  final String correctAnswer;

  @override
  Widget build(BuildContext context) {
    var rightAnswer = Colors.green;
    var wrongAnswer = Colors.redAccent;

    return Row(
      children: [
        Text(
          index.toString(),
          style: TextStyle(
              color: chosenAnswer == correctAnswer ? rightAnswer : wrongAnswer),
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                question,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.orange),
              ),
              Text(
                chosenAnswer,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: chosenAnswer == correctAnswer
                        ? rightAnswer
                        : wrongAnswer),
              ),
              Text(
                correctAnswer,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        )
      ],
    );
  }
}
