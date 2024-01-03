import 'package:countries/models/countries_list_model.dart';
import 'package:countries/models/listView/country_display.dart';
import 'package:flutter/material.dart';

class ListViewCountries extends StatelessWidget {
  const ListViewCountries({required this.updatedList,required this.myList, super.key});

  final List<CountryListModel> myList;
   final void Function(List<CountryListModel> updatedList) updatedList;

  @override
  Widget build(BuildContext context) {
    return myList.isNotEmpty
        ? ListView.builder(
            itemCount: myList.length,
            itemBuilder: (ctx, index) => CountryDisplay(
              updatedList: updatedList,
              country: myList[index],
            ),
          )
        : Center(
            child: Text(
              'Oh-ho..Sorry, No Countries Found',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white),
            ),
          );
  }
}
