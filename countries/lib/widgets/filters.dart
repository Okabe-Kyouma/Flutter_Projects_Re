import 'package:countries/models/countries_list_model.dart';
import 'package:countries/widgets/grid.dart';
import 'package:flutter/material.dart';

List<bool> mySupremeList = [false, false];

class Filters extends StatefulWidget {
  const Filters({required this.filteredList, super.key});

  final void Function(List<bool> list) filteredList;

  @override
  State<Filters> createState() {
    return _FiltersState();
  }
}

class _FiltersState extends State<Filters> {
  bool travelCost = false;
  bool visaFree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Filters'),
        ),
        body: PopScope(
          canPop: true,
          onPopInvoked: (didPop) {},
          child: Column(
            children: [
              SwitchListTile(
                  title: const Text('Travel Cost'),
                  subtitle: const Text('Cost Lower than 100'),
                  value: mySupremeList[0],
                  onChanged: (bool) {
                    setState(() {
                      travelCost = bool;
                      mySupremeList[0] = travelCost;
                    });
                  }),
              SwitchListTile(
                  title: const Text('Visa free'),
                  subtitle: const Text('Does Visa formalities require?'),
                  value: mySupremeList[1],
                  onChanged: (bool) {
                    setState(() {
                      visaFree = bool;
                      mySupremeList[1] = visaFree;
                      widget.filteredList(mySupremeList);
                    });
                  }),
            ],
          ),
        ));
  }
}
