import 'package:countries/helperWidgets/countries_name.dart';
import 'package:countries/list/countries_list.dart';
import 'package:countries/models/countries_list_model.dart';
import 'package:countries/helperWidgets/grid_items.dart';
import 'package:countries/helperWidgets/list_view_countries.dart';
import 'package:countries/widgets/filters.dart';
import 'package:countries/widgets/my_drawer.dart';
import 'package:flutter/material.dart';

class Grid extends StatefulWidget {
  Grid({required this.favoritesList, super.key});

  List<CountryListModel> favoritesList;
  List<bool> filterResultsList = [];

  @override
  State<Grid> createState() {
    return _GridState();
  }
}

class _GridState extends State<Grid> {
  // List<CountryListModel> favoritesList = [];
  var scaffoldtitle = 'Choose Continent';
  var currentNavPageIndex = 0;

  void updatedFavoritesList(List<CountryListModel> updatedFavoritesList) {
    setState(() {
      widget.favoritesList = updatedFavoritesList;
      // favoritesList = updatedFavoritesList;
    });
  }

  void filterOutTheList(List<bool> list){

    

  }

  @override
  Widget build(BuildContext context) {
    print('Supreme list:  $mySupremeList');
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
      drawer: Drawer(
        child: MyDrawer(filteredList: filterOutTheList),
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
          : widget.favoritesList.isEmpty
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
                  updatedList: updatedFavoritesList,
                  myList: widget.favoritesList),
    );
  }
}
