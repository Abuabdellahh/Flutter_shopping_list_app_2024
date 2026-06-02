import 'package:flutter/material.dart';

import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/services/grocery_service.dart';

class GroceryProvider extends ChangeNotifier {
  final _service = GroceryService();

  List<GroceryItem> _items = [];
  bool _isLoading = false;
  String? _error;

  List<GroceryItem> get items => List.unmodifiable(_items);
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadItems() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _items = await _service.fetchItems();
    } catch (e) {
      _error = 'Failed to load items. Please try again.';
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> addItem(GroceryItem item) async {
    final firebaseId = await _service.addItem(item);
    _items.add(GroceryItem(
      id: firebaseId,
      name: item.name,
      quantity: item.quantity,
      category: item.category,
    ));
    notifyListeners();
  }

  Future<void> removeItem(GroceryItem item) async {
    final index = _items.indexOf(item);
    _items.removeAt(index);
    notifyListeners();

    try {
      await _service.removeItem(item.id);
    } catch (e) {
      _items.insert(index, item);
      notifyListeners();
    }
  }
}
