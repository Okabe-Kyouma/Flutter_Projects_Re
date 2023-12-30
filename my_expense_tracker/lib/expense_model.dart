import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();

class ExpenseModel {
  ExpenseModel(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();

  final String title;
  final double amount;
  final DateTime date;
  final String id;
  final Category category;
}

String getFormattedDate(DateTime date) {
  var newDate = DateFormat.yMd('en_US').parse(date.toString());

  return newDate.toString();
}

List<DropdownMenuItem<Category>> getDropDownItemsList() {
  List<DropdownMenuItem<Category>> itemLists = [];

  for (final val in Category.values) {
    itemLists.add(
      DropdownMenuItem(
        value: val,
        child: Text(
          val.toString().toUpperCase().substring(9,val.toString().length),
        ),
      ),
    );
  }
  return itemLists;
}

IconData getIconForCategory(Category category) {
  return category == Category.food
      ? Icons.lunch_dining
      : category == Category.leisure
          ? Icons.play_arrow
          : category == Category.travel
              ? Icons.flight_takeoff
              : Icons.work;
}

enum Category {
  leisure,
  food,
  travel,
  work,
}
