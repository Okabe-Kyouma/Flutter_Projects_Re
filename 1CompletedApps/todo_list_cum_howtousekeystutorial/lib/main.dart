import 'package:flutter/material.dart';
import 'package:todo_list_cum_howtousekeystutorial/todo.dart';

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
        body: Todo(),
      ),
    );
  }
}
