import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shopping_cart/data/categories.dart';
import 'package:shopping_cart/models/grocery_item.dart';
import 'package:shopping_cart/widgets/new_item.dart';
import 'package:http/http.dart' as http;

class GroceriesList extends StatefulWidget {
  const GroceriesList({super.key});

  @override
  State<GroceriesList> createState() => _GroceriesListState();
}

class _GroceriesListState extends State<GroceriesList> {
  List<GroceryItem> _groceryItems = [];
  var _isLoading = true;
  String? _error;

  @override
  void initState() {
    _loadItems();
    super.initState();
  }

  void _loadItems() async {
    final url = Uri.https(
        'shoppingcart-ecae8-default-rtdb.firebaseio.com', 'shopping-list.json');

    try {
      final response = await http.get(url);

      if (response.statusCode >= 400) {
        setState(() {
          _error = 'Failed to fetch data. Please try again later!';
          _isLoading = false;
        });
      }

      if (response.body == 'null') {
        setState(() {
          _isLoading = false;
        });
        return;
      }

      final Map<String, dynamic> listData = json.decode(response.body);
      final List<GroceryItem> loadedItems = [];
      for (final item in listData.entries) {
        final category = categories.entries
            .firstWhere(
                (element) => element.value.item == item.value['category'])
            .value;
        loadedItems.add(
          GroceryItem(
              id: item.key,
              name: item.value['name'],
              quantity: item.value['quantity'],
              category: category),
        );
      }
      setState(() {
        _groceryItems = loadedItems;
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _error = 'Something went wrong. Please try again later!';
        _isLoading = false;
      });
    }
  }

  void _removeItem(GroceryItem item) async {
    
    final index = _groceryItems.indexOf(item);
    final url = Uri.https('shoppingcart-ecae8-default-rtdb.firebaseio.com',
        'shopping-list/${item.id}.json');

    final response = await http.delete(url);

    if (response.statusCode >= 400) {
      setState(() {
        _groceryItems.remove(item);
        _groceryItems.insert(index, item);
      });
    }
  }

  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (ctx) => const NewItem(),
      ),
    );

    if (newItem == null) {
      return;
    }

    setState(() {
      _groceryItems.add(newItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Groceries'),
          actions: [
            IconButton(
              onPressed: _addItem,
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : _error != null
                ? const Center(
                    child:
                        Text('Some Error occured! please try again later....'),
                  )
                : _groceryItems.isNotEmpty
                    ? ListView.builder(
                        itemCount: _groceryItems.length,
                        itemBuilder: (ctx, index) => Dismissible(
                          onDismissed: (direction) {
                            _removeItem(_groceryItems[index]);
                          },
                          background: Container(
                            color: Colors.red,
                          ),
                          direction: DismissDirection.horizontal,
                          key: ValueKey(
                            _groceryItems[index],
                          ),
                          child: ListTile(
                            title: Text(_groceryItems[index].name),
                            leading: Container(
                              width: 24,
                              height: 24,
                              color: _groceryItems[index].category.color,
                            ),
                            trailing:
                                Text(_groceryItems[index].quantity.toString()),
                          ),
                        ),
                      )
                    : Center(
                        child: Text(
                          'No items found! Add an item',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: Colors.white),
                        ),
                      ));
  }
}
