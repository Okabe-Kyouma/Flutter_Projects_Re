import 'package:countries/list/countries_list.dart';
import 'package:countries/helperWidgets/list_view_countries.dart';
import 'package:countries/widgets/filters.dart';
import 'package:flutter/material.dart';
import 'package:countries/models/countries_list_model.dart';

class CountriesName extends StatelessWidget {
  const CountriesName(this.continentName,
      {required this.updatedList, super.key});

  final String continentName;
  final void Function(List<CountryListModel> updatedList) updatedList;

  @override
  Widget build(BuildContext context) {
    List<CountryListModel> filterContientWiseCountry() {
      List<CountryListModel> myFinalCountriesListFiltered = myFinalcountriesList
          .where((element) => element.continentInWhichIn == continentName)
          .toList();

      print('${mySupremeList[0]} && ${mySupremeList[1]}');

      if (mySupremeList[1]) {
        myFinalCountriesListFiltered = myFinalCountriesListFiltered
            .where((element) => element.isVisaFree == mySupremeList[1])
            .toList();
      }

      if (mySupremeList[0]) {
        myFinalCountriesListFiltered = myFinalCountriesListFiltered
            .where((element) => element.overallCountryTravelCost <= 100)
            .toList();
      }

      return myFinalCountriesListFiltered;
    }

    return Scaffold(
      body: ListViewCountries(
          updatedList: updatedList, myList: filterContientWiseCountry()),
      appBar: AppBar(
        title: Hero(tag: continentName, child: Text(continentName)),
      ),
    );
  }
}
