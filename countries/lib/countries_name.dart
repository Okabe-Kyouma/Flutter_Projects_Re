import 'package:countries/models/countries_list.dart';
import 'package:countries/models/listView/list_view_countries.dart';
import 'package:flutter/material.dart';
import 'package:countries/models/countries_list_model.dart';

class CountriesName extends StatelessWidget {
  const CountriesName(this.continentName, {required this.updatedList,super.key});

  final String continentName;
  final void Function(List<CountryListModel> updatedList) updatedList;

  @override
  Widget build(BuildContext context) {
    List<CountryListModel> filterContientWiseCountry() {
      List<CountryListModel> myFinalCountriesListFiltered = myFinalcountriesList
          .where((element) => element.continentInWhichIn == continentName)
          .toList();

      return myFinalCountriesListFiltered;
    }

    return Scaffold(
      body: ListViewCountries(updatedList: updatedList,myList: filterContientWiseCountry()),
      appBar: AppBar(
        title: Text(continentName),
      ),
    );
  }
}
