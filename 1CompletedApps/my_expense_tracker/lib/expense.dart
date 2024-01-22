import 'package:flutter/material.dart';
import 'package:my_expense_tracker/expense_model.dart';
import 'package:my_expense_tracker/expenses_list.dart';
import 'package:my_expense_tracker/modal_sheet.dart';

class Expense extends StatefulWidget {
  const Expense({super.key});
  @override
  State<Expense> createState() {
    return _ExpenseState();
  }
}

class _ExpenseState extends State<Expense> {
  List<ExpenseModel> d = [];

  void newExpenseAdder(ExpenseModel expenseModel) {
    print("this is going to get executed soon");
    setState(() {
      print(expenseModel);
      d.add(expenseModel);
    });
  }

  void removeTheExpense(ExpenseModel expenseModel, int index) {
    setState(() {
      d.remove(expenseModel);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Expense Deleted'),
        action: SnackBarAction(
            label: "Undo",
            onPressed: () {
              reinsertTheExpense(expenseModel, index);
            }),
      ),
    );
  }

  void reinsertTheExpense(ExpenseModel expenseModel, int index) {
    setState(() {
      d.insert(index, expenseModel);
    });
  }

  void addNewExpense() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => ModalSheet(
              addNewExpense: newExpenseAdder,
            ));
  }

  @override
  Widget build(BuildContext context) {
    // d.add(expenseModel);
    // d.add(expenseModel2);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expense tracker'),
        actions: [
          IconButton(
              onPressed: () {
                addNewExpense();
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      body: d.isNotEmpty
          ? Center(
              child: Column(
                children: [
                  ExpensesList(
                      removeExpense: removeTheExpense, expensesList: d),
                ],
              ),
            )
          : const Center(
              child: Text('No Expenses! Add Some Expenses!'),
            ),
    );
  }
}
