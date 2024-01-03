import 'package:flutter/material.dart';
import 'package:todo_list_cum_howtousekeystutorial/list_model.dart';
import 'package:todo_list_cum_howtousekeystutorial/list_view.dart';

class ListItems extends StatelessWidget {
  ListItems({required this.myListOfItems, super.key});

  List<ListModel> myListOfItems;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: myListOfItems.length,
        itemBuilder: (ctx, index) => ItemListView(
          myListItem: myListOfItems[index],
          key: ObjectKey(myListOfItems[index]),
        ),
      ),
    );
  }
}
