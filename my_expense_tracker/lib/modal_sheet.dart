import 'package:flutter/material.dart';
import 'package:my_expense_tracker/expense_model.dart';

class ModalSheet extends StatefulWidget {
  ModalSheet({required this.addNewExpense, super.key});

  void Function(ExpenseModel expenseModel) addNewExpense;

  @override
  State<ModalSheet> createState() {
    return _ModalSheetState();
  }
}

class _ModalSheetState extends State<ModalSheet> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  var finalDate;
  var getCategory = Category.leisure;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void saveNewExpense() {
    var amount = double.tryParse(_amountController.text);

    if (_titleController.text.isNotEmpty &&
        amount != null &&
        amount >= 0 &&
        finalDate != null) {
      print(getCategory);

      print("this is going to get executed soon2");

      widget.addNewExpense(ExpenseModel(
          title: _titleController.text,
          amount: amount,
          date: finalDate,
          category: getCategory));
      Navigator.pop(context);
    } else {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text('Invalid Input'),
                content: const Text(
                    "this is the workd ke we dno akls hnre and this is woll fskkm to make fuss about"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Okay'),
                  ),
                ],
                // actions: [Title(color: Colors.black, child: Text("hi"))],
              ));
    }
  }

  void displayDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    var selectedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      finalDate = selectedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 40, 20, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            keyboardType: TextInputType.text,
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
                  keyboardType: TextInputType.number,
                  controller: _amountController,
                  decoration: const InputDecoration(
                    label: Text('Amount'),
                    prefixText: '\$',
                  ),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Text(finalDate == null
                  ? 'No date Selected'
                  : finalDate.toString().substring(0, 10)),
              IconButton(
                onPressed: () {
                  displayDatePicker();
                },
                icon: const Icon(Icons.calendar_month),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              DropdownButton<Category>(
                items: getDropDownItemsList(),
                onChanged: (dynamic val) {
                  setState(() {
                    getCategory = val;
                  });
                },
                value: getCategory,
              ),
              const Spacer(),
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              const SizedBox(
                width: 10,
              ),
              OutlinedButton(
                onPressed: () {
                  saveNewExpense();
                },
                child: const Text('Save Expense'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
