import 'package:flutter/material.dart';

class GridItems extends StatelessWidget {
  const GridItems(
      {required this.countryName,
      required this.colors,
      required this.index,
      required this.continentchosen,
      super.key});

  final Function(String chosenChontinentName) continentchosen;
  final String countryName;
  final List<List<Color>> colors;
  final index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        continentchosen(countryName);
      },
      child: Card(
        elevation: 2,
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                  colors: colors[index],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
            ),
            child: Center(
              child: Hero(
                tag: countryName,
                child: Text(
                  countryName,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 18, color: Colors.white),
                ),
              ),
            )),
      ),
    );
  }
}
