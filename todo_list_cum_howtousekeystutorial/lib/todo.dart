import 'package:flutter/material.dart';
import 'package:todo_list_cum_howtousekeystutorial/list_items.dart';
import 'package:todo_list_cum_howtousekeystutorial/list_model.dart';
import 'package:todo_list_cum_howtousekeystutorial/run.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() {
    return _TodoState();
  }
}

class _TodoState extends State<Todo> {
   List<bool?> checkBoxValues = [false, false, false];
  List<ListModel> finalList = listOfItems();
  bool value = true;
  var currentText = 'Sort Ascending';
  bool? val1 = false;

  @override
  Widget build(BuildContext context) { 
    void changeOrder() {
      if (value) {
        setState(() {
          finalList = sortAscendingList();
          value = false;
          currentText = 'Sort Ascending';
        });
      } else {
        setState(() {
          finalList = sortDescendingList();
          value = true;
          currentText = 'Sort Decending';
        });
      }
    }

    void whichCheckBoxValueChange(var index, bool? boo) {
      setState(() {
        checkBoxValues[index] = boo;
        finalList[index].answer = boo;
      });
    }

    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextButton.icon(
            onPressed: () {
              changeOrder();
            },
            icon: const Icon(Icons.arrow_upward),
            label: Text(
              currentText,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          // ListItems(myListOfItems: finalList),
          for (var a = 0; a < 3; a++)
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Run(
                  checkBoxValue: finalList[a].answer,
                  checkTheBox: whichCheckBoxValueChange,
                  index: a,
                ),
                const SizedBox(
                  width: 10,
                ),
                Icon(finalList[a].icon),
                const SizedBox(
                  width: 10,
                ),
                Text(finalList[a].text),
              ],
            ),
        ],
      ),
    );
  }
}
