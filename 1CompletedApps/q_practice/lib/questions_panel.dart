import 'package:flutter/material.dart';
import 'package:q_practice/answer_button.dart';
import 'package:q_practice/questions.dart';

var currentQuestionIndex = 0;

class QuestionsPanel extends StatefulWidget {
  const QuestionsPanel(this.goToResultPage, {super.key});

  final void Function() goToResultPage;

  @override
  State<QuestionsPanel> createState() {
    return _QuestionsPanelState();
  }
}

class _QuestionsPanelState extends State<QuestionsPanel> {
  void onOptionIsSelected() {
    setState(() {
      currentQuestionIndex++;

      if (currentQuestionIndex == questions.length) {
        currentQuestionIndex = -1;
      }

      if (currentQuestionIndex == -1) {
        widget.goToResultPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> answersList = questions[currentQuestionIndex].getShuffledAnswers();
    final String questionList = questions[currentQuestionIndex].text;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(left: 30, right: 30),
          child: Text(
            questionList,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ...answersList.map((item) {
          return AnswerButton(
              onSelectedOption: onOptionIsSelected, options: item);
        }),
      ],
    );
  }
}
