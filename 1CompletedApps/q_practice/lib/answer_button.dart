import 'package:flutter/material.dart';

final List<String> chosenAnswersList = [];

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {super.key, required this.options, required this.onSelectedOption});

  final String options;
  final void Function() onSelectedOption;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 40),
      child: ElevatedButton(
        onPressed: () {
          onSelectedOption();
          chosenAnswersList.add(options);
        },
        style: ElevatedButton.styleFrom(
          alignment: Alignment.center,
          backgroundColor: Colors.transparent,
          side: const BorderSide(color: Color.fromARGB(10, 255, 255, 255)),
        ),
        child: Text(
          options,
          style: const TextStyle(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
