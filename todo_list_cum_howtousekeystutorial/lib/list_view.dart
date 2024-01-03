import 'package:flutter/material.dart';
import 'package:todo_list_cum_howtousekeystutorial/list_model.dart';

class ItemListView extends StatefulWidget {
  const ItemListView({required this.myListItem, super.key});

  final ListModel myListItem;

  @override
  State<ItemListView> createState() {
    return _ItemListViewState();
  }
}

class _ItemListViewState extends State<ItemListView> {
  // bool answer = false;
  bool? val1 = false;

  @override
  Widget build(BuildContext context) {
    ListModel myListItem = widget.myListItem;

    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        Checkbox(
            value: val1,
            onChanged: (bool) {
              setState(() {
                val1 = bool;
                // listOfItems();
              });
            }),
        const SizedBox(
          width: 10,
        ),
        Icon(myListItem.icon),
        const SizedBox(
          width: 10,
        ),
        Text(myListItem.text.toString()),
      ],
    );
  }
}
