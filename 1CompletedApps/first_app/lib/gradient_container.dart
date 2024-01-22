import 'package:first_app/dice_roller.dart';
import 'package:flutter/material.dart';

var startAlignment = Alignment.topLeft;
var endAlignment = Alignment.bottomRight;
List<Color> listOfColors = [];

class GradientContainer extends StatelessWidget {
  GradientContainer(List<Color> colors, {super.key}) {
    listOfColors = colors;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: listOfColors, begin: startAlignment, end: endAlignment),
      ),
      child: const Center(child: DiceRoller()),
    );
  }
}
