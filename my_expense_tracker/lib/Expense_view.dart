import 'package:flutter/material.dart';
import 'package:my_expense_tracker/expense_model.dart';

class ExpenseView extends StatelessWidget {
  const ExpenseView(this.myExpensesItem, {super.key});

  final ExpenseModel myExpensesItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
      height: 80,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Text(
                  myExpensesItem.title,
                  style: const TextStyle(fontSize: 16),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '\$${myExpensesItem.amount.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 16),
                ),
                const Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(getIconForCategory(myExpensesItem.category)),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(myExpensesItem.date.toString().substring(0, 10)),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
