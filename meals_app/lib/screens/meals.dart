import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_details.dart';
import 'package:meals_app/screens/meals_list_screen.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({required this.onToggleFavorite,this.title, required this.meals, super.key});

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavorite;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(onToggleFavorite: onToggleFavorite,meal: meal),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return title != null
        ? Scaffold(
            appBar: AppBar(
              title: Text(title!),
            ),
            body: meals.isNotEmpty
                ? ListView.builder(
                    itemCount: meals.length,
                    itemBuilder: (ctx, index) => MealslistScreen(
                      meal: meals[index],
                      onSelectMeal: (meal) {
                        selectMeal(context, meal);
                      },
                    ),
                  )
                : Center(
                    child: Text(
                      'Oh-ho! Sorry No Meals found for this category',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
          )
        : meals.isNotEmpty
            ? ListView.builder(
                itemCount: meals.length,
                itemBuilder: (ctx, index) => MealslistScreen(
                  meal: meals[index],
                  onSelectMeal: (meal) {
                    selectMeal(context, meal);
                  },
                ),
              )
            : Center(
                child: Text(
                  'Oh-ho! Sorry No Meals found for this category',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              );
  }
}
