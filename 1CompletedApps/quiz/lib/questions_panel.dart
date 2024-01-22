
import 'package:flutter/material.dart';

class QuestionsPanel extends StatefulWidget {
  const QuestionsPanel({super.key});

  @override
  State<QuestionsPanel> createState() {
    return _QuestionsPanel();
  }
}

class _QuestionsPanel extends State<QuestionsPanel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.deepPurpleAccent, Colors.pinkAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)),
      child: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Question will appear here!!",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  decorationColor: Colors.transparent),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(onPressed: null, child: Text('answer')),
            ElevatedButton(onPressed: null, child: Text('answer')),
            ElevatedButton(onPressed: null, child: Text('answer')),
            ElevatedButton(onPressed: null, child: Text('answer')),
          ],
        ),
      ),
    );
  }
}
