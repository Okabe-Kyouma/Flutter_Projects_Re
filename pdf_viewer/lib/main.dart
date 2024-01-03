import 'package:flutter/material.dart';
import 'package:pdf_viewer/pdf.dart';

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
          backgroundColor: Colors.deepPurple,
          title: const Text('PDF Viewer'),
          foregroundColor: Colors.white,
        ),
        body: const Pdf(),
      ),
    );
  }
}





