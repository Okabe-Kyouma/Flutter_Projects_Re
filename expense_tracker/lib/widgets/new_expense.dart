import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

List<Expense> newExpense = [];

class NewExpense extends StatefulWidget {
  NewExpense({required this.addNewExpense, super.key});

  void Function(Expense expense) addNewExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selecteddate;
  Category _selectedCategory = Category.leisure;
  DateTime finalDate = DateTime(2023);

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);

    setState(() {
      _selecteddate = pickedDate;
    });
    finalDate = pickedDate as DateTime;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;

    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selecteddate == null) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text('Invalid Input'),
                content: const Text(
                    'Please make sure a valid title,amount,date and category was entered.'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Okay')),
                ],
              ));
      return;
    } else {
      newExpense.add(Expense(
          title: _titleController.text,
          amount: double.parse(_amountController.text),
          data: finalDate,
          category: _selectedCategory));
      // Expenses(myExpenses: newExpense);

      widget.addNewExpense(Expense(
          title: _titleController.text,
          amount: double.parse(_amountController.text),
          data: finalDate,
          category: _selectedCategory));

      Navigator.pop(context);

      // Navigator.pushReplacement(
      //         context,
      //         MaterialPageRoute(
      //             builder: (ctx) => Expenses(myExpenses: newExpense)))
      // .then((value) => Navigator.pop(context));

      // Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    final orientation = MediaQuery.of(context).orientation;

    Widget orientationContainer;

    return orientation == Orientation.portrait
        ? Padding(
            padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
            child: Column(
              children: [
                TextField(
                  controller: _titleController,
                  maxLength: 50,
                  decoration: const InputDecoration(
                    label: Text('Title'),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _amountController,
                        decoration: const InputDecoration(
                          label: Text('Amount'),
                          prefixText: '\$',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            _selecteddate == null
                                ? 'No date selected'
                                : formatter.format(_selecteddate!),
                          ),
                          IconButton(
                              onPressed: _presentDatePicker,
                              icon: const Icon(Icons.calendar_month))
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    DropdownButton(
                        value: _selectedCategory,
                        items: Category.values
                            .map((category) => DropdownMenuItem(
                                value: category,
                                child: Text(category.name.toUpperCase())))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            if (value == null) return;
                            _selectedCategory = value;
                          });
                        }),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _submitExpenseData();
                      },
                      child: const Text('Save Expense'),
                    ),
                  ],
                ),
              ],
            ),
          )
        : SizedBox(
            width: double.maxFinite,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 48, 16, keyboardSpace + 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _titleController,
                            maxLength: 50,
                            decoration: const InputDecoration(
                              label: Text('Title'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          child: TextField(
                            textAlign: TextAlign.start,
                            controller: _amountController,
                            decoration: const InputDecoration(
                              label: Text('Amount'),
                              prefixText: '\$',
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        DropdownButton(
                            value: _selectedCategory,
                            items: Category.values
                                .map((category) => DropdownMenuItem(
                                    value: category,
                                    child: Text(category.name.toUpperCase())))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                if (value == null) return;
                                _selectedCategory = value;
                              });
                            }),
                        const Spacer(),
                        Text(
                          _selecteddate == null
                              ? 'No date selected'
                              : formatter.format(_selecteddate!),
                        ),
                        IconButton(
                            onPressed: _presentDatePicker,
                            icon: const Icon(Icons.calendar_month))
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Cancel'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _submitExpenseData();
                          },
                          child: const Text('Save Expense'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
