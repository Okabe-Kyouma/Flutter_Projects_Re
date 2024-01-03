import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealslistScreen extends StatelessWidget {
  const MealslistScreen(
      {required this.onSelectMeal, required this.meal, super.key});

  final Meal meal;

  final void Function(Meal meal) onSelectMeal;

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   margin: const EdgeInsets.all(16),
    //   width: double.infinity,
    //   height: 80,
    //   child: Card(
    //     child: Container(
    //         margin: const EdgeInsets.all(8),
    //         child: Row(
    //           children: [
    //             Container(
    //               height: 45,
    //               width: 50,
    //               decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(10),
    //                   border: Border.all(
    //                       color: Colors.white,
    //                       style: BorderStyle.solid,
    //                       width: 2)),
    //               child: Image.network(
    //                 fit: BoxFit.fill,
    //                 meal.imageUrl,
    //                 height: 45,
    //                 width: 40,
    //               ),
    //             ),
    //             const SizedBox(
    //               width: 40,
    //             ),
    //             Text(
    //               meal.title,
    //               style: Theme.of(context)
    //                   .textTheme
    //                   .titleLarge!
    //                   .copyWith(color: Colors.white, fontSize: 14),
    //             )
    //           ],
    //         )),
    //   ),
    // );

    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
          onSelectMeal(meal);
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(
                            icon: Icons.schedule,
                            label: '${meal.duration} min'),
                        const SizedBox(
                          width: 12,
                        ),
                        MealItemTrait(
                            icon: Icons.attach_money,
                            label:
                                '${meal.complexity.toString().substring(11, meal.complexity.toString().length).toUpperCase()}'),
                        const SizedBox(
                          width: 12,
                        ),
                        MealItemTrait(
                            icon: Icons.attach_money,
                            label:
                                '${meal.affordability.toString().substring(14, meal.affordability.toString().length).toUpperCase()}'),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
