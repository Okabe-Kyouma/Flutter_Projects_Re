import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // return Image.asset('assets/images/quiz-logo.png',height: 300,);
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.deepPurpleAccent, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/quiz-Logo.png',
              height: 300,
              color: const Color.fromARGB(150, 255, 255, 255),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Learn Flutter the Fun Way!",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(
              height: 30,
            ),
            OutlinedButton.icon(
              onPressed: () {
                
              },
              style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shape: const BeveledRectangleBorder(),
                  side: const BorderSide(color: Color.fromARGB(10, 0, 0, 0))),
              icon: const Icon(
                Icons.arrow_right_alt,
                color: Colors.white,
              ),
              label: const Text(
                'Start Quiz',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
