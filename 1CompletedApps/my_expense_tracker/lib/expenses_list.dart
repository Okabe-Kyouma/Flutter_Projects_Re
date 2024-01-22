import 'package:flutter/material.dart';
import 'package:my_expense_tracker/Expense_view.dart';
import 'package:my_expense_tracker/expense_model.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {required this.removeExpense, required this.expensesList, super.key});

  final List<ExpenseModel> expensesList;
  final void Function(ExpenseModel expenseModel,int index) removeExpense;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: expensesList.length,
        itemBuilder: (context, index) => Dismissible(
          key: Key(expensesList[index].id),
          onDismissed: (direction) => {removeExpense(expensesList[index],index)},
          background: Container(
            color: Colors.red,
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
          ),
          child: ExpenseView(
            expensesList[index],
          ),
        ),
      ),
    );
  }
}
