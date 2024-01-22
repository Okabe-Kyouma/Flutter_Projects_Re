import 'package:flutter/material.dart';
import 'package:todo_list_cum_howtousekeystutorial/todo.dart';

class ListModel {
  ListModel(
      {required this.answer,
      required this.checkbox,
      required this.icon,
      required this.text});

  Checkbox checkbox;
  final IconData icon;
  final String text;
  bool? answer;
}

List<ListModel> sortAscendingList() {
  List<ListModel> ascendingList = [];
  ascendingList = List.from(listOfItems());

  ascendingList.sort((a, b) => a.text.compareTo(b.text));

  return ascendingList;
}

List<ListModel> sortDescendingList() {
  List<ListModel> descendingList = List.from(listOfItems());

  descendingList.sort((a, b) => b.text.compareTo(a.text));

  return descendingList;
}

List<ListModel> listOfItems() {
  List<ListModel> myList = [];

  bool? val1, val2, val3;

  var c = ListModel(
    checkbox: Checkbox(
        value: val1,
        onChanged: (bool) {
          val1 = bool;
        }),
    icon: Icons.menu_open_rounded,
    text: 'Practice Flutter',
    answer: val1,
  );

  var d = ListModel(
    checkbox: Checkbox(value: false, onChanged: (bool) {}),
    icon: Icons.select_all_sharp,
    text: 'The world',
    answer: val2,
  );

  var e = ListModel(
    checkbox: Checkbox(value: false, onChanged: (bool) {}),
    icon: Icons.money_outlined,
    text: 'Explore other courses',
    answer: val3,
  );

  myList.add(c);
  myList.add(d);
  myList.add(e);

  return myList;
}
