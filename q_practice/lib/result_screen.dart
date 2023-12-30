import 'package:flutter/material.dart';
import 'package:q_practice/answer_button.dart';
import 'package:q_practice/questions.dart';
import 'package:q_practice/result_screen_helper.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, List<String>>> data = [];

    for (var a = 0; a < questions.length; a++) {
      Map<String, List<String>> map = {
        questions[a].text: [
          chosenAnswersList[a],
          questions[a].answers[0],
          (a + 1).toString(),
        ],
      };
      data.add(map);
    }
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...data.map((item) {
              return ResultScreenHelper(
                  question: item.keys.first,
                  chosenAnswer: item.values.first[0],
                  correctAnswer: item.values.first[1],
                  index: item.values.first[2]);
            }),
          ],
        ),
      ),
    );
  }
}
