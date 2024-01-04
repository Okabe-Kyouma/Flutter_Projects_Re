import 'package:countries/list/countries_list.dart';
import 'package:countries/widgets/city_display.dart';
import 'package:countries/models/countries_list_model.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class CountryDisplay extends StatelessWidget {
  const CountryDisplay({required this.updatedList,required this.country, super.key});

  final CountryListModel country;
 final void Function(List<CountryListModel> updatedList) updatedList;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (ctx) => CityDisplay(updatedList: updatedList ,myFavoritesList: favoritesList,country: country)),
        );
      },
      child: Container(
        width: double.infinity,
        height: 300,
        child: Stack(
          children: [
            Hero(
              tag:country.countryName ,
              child: FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(country.countryImageLink)),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        country.countryName.toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        country.popularFor,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
