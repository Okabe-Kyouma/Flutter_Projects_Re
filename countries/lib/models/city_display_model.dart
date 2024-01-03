import 'package:countries/models/countries_list_model.dart';
import 'package:flutter/material.dart';

class CityDisplayModel extends StatelessWidget {
  const CityDisplayModel({required this.country, super.key});

  final CountryListModel country;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(elevation: 10, child: Image.network(country.countryImageLink)),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Best Cities To Visit',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.white, decoration: TextDecoration.underline),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            '${country.bestPlacesToVisit[0].citiesName}',
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Colors.white),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Popular For',
            // style: TextStyle(color: Colors.white, fontSize: 17),
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.white, decoration: TextDecoration.underline),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            country.popularFor,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Colors.white),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Total Population',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.white),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            country.countryPopulation.toString(),
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Colors.white),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Country Size',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.white),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            country.countrySize.toString(),
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Colors.white),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Overall Country Travel Cost',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.white),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            '\$${country.overallCountryTravelCost.toString()}',
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Colors.white),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Visa Requirements',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.white),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            country.isVisaFree ? 'None' : 'Additional',
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Colors.white),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
