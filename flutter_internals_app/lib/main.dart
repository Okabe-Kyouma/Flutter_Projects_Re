import 'package:flutter/material.dart';
import 'package:flutter_internals_app/buttons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Internals'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 65),
                child: const Text(
                  'Every Flutter Developer Should have a basic underStanding of Flutter\'s internals?',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Do you understand how flutter updates UIs?'),
              const SizedBox(
                height: 15,
              ),
              const Buttons(),
            ],
          ),
        ),
      ),
    );
  }
}
