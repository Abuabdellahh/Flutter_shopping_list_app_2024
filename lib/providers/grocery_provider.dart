import 'package:flutter/material.dart';

import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/services/grocery_service.dart';

class GroceryProvider extends ChangeNotifier {
  final _service = GroceryService();

  List<GroceryItem> get items => _service.items;

  void addItem(GroceryItem item) {
    _service.addItem(item);
    notifyListeners();
  }

  void removeItem(GroceryItem item) {
    _service.removeItem(item);
    notifyListeners();
  }
}
