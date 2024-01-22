import 'package:countries/models/best_places_to_visit.dart';

class CountryListModel {
  const CountryListModel(
      {required this.continentInWhichIn,
      required this.countryName,
      required this.countryImageLink,
      required this.bestPlacesToVisit,
      required this.popularFor,
      required this.countryPopulation,
      required this.countrySize,
      required this.overallCountryTravelCost,
      required this.isVisaFree});

  final String continentInWhichIn;
  final String countryName;
  final String countryImageLink;
  final List<BestPlacesToVisit> bestPlacesToVisit;
  final String popularFor;
  final num countryPopulation;
  final num overallCountryTravelCost;
  final num countrySize;
  final bool isVisaFree;
}
