import 'package:flutter/material.dart';

class Buttons extends StatefulWidget {
  const Buttons({super.key});

  @override
  State<Buttons> createState() {
    return _ButtonsState();
  }
}

class _ButtonsState extends State<Buttons> {
  bool value = false;

  void onClicked(bool val) {
    setState(() {
      val ? value = true : value = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                onClicked(false);
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                onClicked(true);
              },
              child: const Text('Yes'),
            ),
          ],
        ),
        if (value) const Text('Awesome'),
      ],
    );
  }
}
