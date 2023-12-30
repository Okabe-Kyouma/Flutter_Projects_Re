import 'package:expense_tracker/chart/chart.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  Expenses({super.key, required this.myExpenses});

  List<Expense> myExpenses;

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  List<Expense> finallist = [];

  void _addExpenses(Expense expense) {
    print("it's working");
    setState(() {
      finallist.add(expense);
    });
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(
        addNewExpense: _addExpenses,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // List<Expense> registeredExpenes = widget.myExpenses;

    void _removeExpense(Expense expense) {
      final expenseIndex = finallist.indexOf(expense);
      setState(() {
        finallist.remove(expense);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Expense Deleted'),
          duration: const Duration(seconds: 3),
          action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                setState(() {
                  finallist.insert(expenseIndex, expense);
                });
              }),
        ),
      );
    }

    Widget mainContent = const Center(
      child: Text('No expenses found! Start adding some!'),
    );

    if (finallist.isNotEmpty) {
      setState(() {
        mainContent =
            ExpensesList(expenses: finallist, removeExpense: _removeExpense);
      });
    } else {
      setState(() {
        mainContent = const Center(
          child: Text('No expenses found! Start adding some!'),
        );
      });
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Expense Tracker'), actions: [
        IconButton(
            onPressed: () {
              _openAddExpenseOverlay();
            },
            icon: const Icon(Icons.add))
      ]),
      body: Column(
        children: [
          Chart(expenses: finallist),
          Expanded(child: mainContent),
        ],
      ),
    );
  }
}
