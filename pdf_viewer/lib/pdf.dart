import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdfWidgets;
import 'package:pdf/widgets.dart' show PdfViewerController;

class Pdf extends StatefulWidget {
  const Pdf({super.key});

  @override
  State<Pdf> createState() {
    return _PdfState();
  }
}

class _PdfState extends State<Pdf> {
  void _pickAndOpenPdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: _pickAndOpenPdf, child: const Text('Select and Open PDF')),
    );
  }
}
