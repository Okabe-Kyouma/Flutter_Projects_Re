import 'package:countries/countries_name.dart';
import 'package:countries/favorites.dart';
import 'package:countries/models/countries_list.dart';
import 'package:countries/models/countries_list_model.dart';
import 'package:countries/models/grid/grid_items.dart';
import 'package:countries/models/listView/list_view_countries.dart';
import 'package:flutter/material.dart';

class Grid extends StatefulWidget {
  const Grid({super.key});

  @override
  State<Grid> createState() {
    return _GridState();
  }
}

class _GridState extends State<Grid> {
  List<CountryListModel> favoritesList = [];
  var scaffoldtitle = 'Choose Continent';
  var currentNavPageIndex = 0;

  void updatedFavoritesList(List<CountryListModel> updatedFavoritesList) {
    setState(() {
      favoritesList = updatedFavoritesList;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<List<Color>> colors = [
      [Colors.pink, Colors.pink.withOpacity(0.5)],
      [Colors.deepPurpleAccent, Colors.deepPurpleAccent.withOpacity(0.5)],
      [Colors.deepOrangeAccent, Colors.deepOrangeAccent.withOpacity(0.5)],
      [Colors.green, Colors.green.withOpacity(0.5)],
      [Colors.blue, Colors.blue.withOpacity(0.5)],
      [Colors.yellow, Colors.yellow.withOpacity(0.5)],
      [Colors.redAccent, Colors.redAccent.withOpacity(0.5)],
      [Colors.cyanAccent, Colors.cyanAccent.withOpacity(0.5)],
    ];
    List<String> countryNames = [
      "Asia",
      "North America",
      "South America",
      "Africa",
      "Europe",
      "Australia",
      "Antarctica",
      "Local"
    ];

    void onContientChosen(String chosenContient) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) =>
              CountriesName(updatedList: updatedFavoritesList, chosenContient),
        ),
      );
    }

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_outlined), label: "Continents"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favorites"),
        ],
        enableFeedback: true,
        currentIndex: currentNavPageIndex,
        onTap: (indx) {
          setState(() {
            currentNavPageIndex = indx;
            scaffoldtitle = currentNavPageIndex == 0
                ? 'Choose Continent'
                : 'Your Favorites';
          });
        },
      ),
      appBar: AppBar(
        title: Text(scaffoldtitle),
      ),
      body: currentNavPageIndex == 0
          ? GridView(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              children: [
                for (var a = 0; a < 8; a++)
                  GridItems(
                    countryName: countryNames[a],
                    colors: colors,
                    index: a,
                    continentchosen: onContientChosen,
                  )
              ],
            )
          : favoritesList.isEmpty
              ? Center(
                  child: Text(
                    'Oh-ho..Sorry, No Favorites Found',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.white),
                  ),
                )
              : ListViewCountries(
                  updatedList: updatedFavoritesList, myList: favoritesList),
    );
  }
}
