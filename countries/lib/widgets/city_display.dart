import 'package:countries/widgets/city_display_model.dart';
import 'package:countries/models/countries_list_model.dart';
import 'package:flutter/material.dart';

class CityDisplay extends StatefulWidget {
  const CityDisplay(
      {required this.updatedList,
      required this.myFavoritesList,
      required this.country,
      super.key});

  final CountryListModel country;
  final List<CountryListModel> myFavoritesList;
  final void Function(List<CountryListModel> updatedList) updatedList;

  @override
  State<StatefulWidget> createState() {
    return _CityDisplayState();
  }
}

class _CityDisplayState extends State<CityDisplay> {
  var defaultColorOfFavButton = Colors.white.withOpacity(0.5);
  var snackBarText = 'Added To Favorites';
  bool isAddedToFav = false;

  List<CountryListModel> favoritesList = [];

  void showSnackBar() {
    if (isAddedToFav) {
      setState(() {
        snackBarText = 'Added To Favorites';
        favoritesList.add(widget.country);
      });
    } else {
      setState(() {
        snackBarText = 'Removed From Favorites';
        favoritesList.remove(widget.country);
      });
    }

     widget.updatedList(favoritesList);

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          snackBarText,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
    );
  }

  @override
  void initState() {
    favoritesList = widget.myFavoritesList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('FAvorite LIst length:  ${favoritesList.length}');
    if (favoritesList.contains(widget.country)) {
      defaultColorOfFavButton = Colors.red;
      isAddedToFav = true;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.country.countryName.toUpperCase(),
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: InkWell(
              onTap: () {
                setState(() {
                  defaultColorOfFavButton =
                      defaultColorOfFavButton == Colors.white.withOpacity(0.5)
                          ? Colors.red
                          : Colors.white.withOpacity(0.5);
                  isAddedToFav = isAddedToFav ? false : true;
                });
                showSnackBar();
              },
              child: Icon(
                Icons.favorite,
                color: defaultColorOfFavButton,
              ),
            ),
          ),
        ],
      ),
      body: CityDisplayModel(country: widget.country),
    );
  }
}
