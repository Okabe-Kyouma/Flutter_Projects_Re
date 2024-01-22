import 'package:flutter/material.dart';
import 'package:shopping_cart/data/categories.dart';
import 'package:shopping_cart/models/category.dart';
import 'package:shopping_cart/models/grocery_item.dart';

class GroceriesListHeler extends StatelessWidget {
  const GroceriesListHeler({required this.item, super.key});

  final GroceryItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(color: item.category.color),
          ),
          const SizedBox(
            width: 30,
          ),
          Text(
            item.name,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Spacer(),
          Text(item.quantity.toString()),
          const SizedBox(
            width: 20,
          )
        ],
      ),
    );
  }
}
