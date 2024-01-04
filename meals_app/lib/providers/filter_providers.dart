import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/meals_provider.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegan: false,
          Filter.vegetarian: false
        });

  void setFilters(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
        (ref) => FiltersNotifier());

final filteredMealsProviders = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filtersProvider);

  return meals.where((mean) {
    if (activeFilters[Filter.glutenFree]! && !mean.isGlutenFree) {
      return false;
    }

    if (activeFilters[Filter.lactoseFree]! && !mean.isLactoseFree) {
      return false;
    }

    if (activeFilters[Filter.vegan]! && !mean.isVegan) {
      return false;
    }

    if (activeFilters[Filter.vegetarian]! && !mean.isVegetarian) {
      return false;
    }

    return true;
  }).toList();
});
