import 'package:flutter/material.dart';

class Run extends StatefulWidget {
  Run(
      {required this.index,
      required this.checkTheBox,
      required this.checkBoxValue,
      super.key});

  bool? checkBoxValue = false;
  final index;
  void Function(num index, bool? boo) checkTheBox;

  @override
  State<Run> createState() {
    return _RunState();
  }
}

class _RunState extends State<Run> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
        value: widget.checkBoxValue,
        key: ValueKey(widget.index),
        onChanged: (bool) {
          setState(() {
            widget.checkBoxValue = bool;
            widget.checkTheBox(widget.index, bool);
          });
        });
  }
}
