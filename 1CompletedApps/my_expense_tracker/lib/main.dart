import 'package:flutter/material.dart';
import 'package:my_expense_tracker/expense.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        appBarTheme: AppBarTheme(   
            backgroundColor: Colors.deepPurpleAccent[400],
            foregroundColor: Colors.white),
      ),
      home: const Expense(),
    );
  }
}
