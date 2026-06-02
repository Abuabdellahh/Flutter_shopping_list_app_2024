import 'package:shopping_list/models/grocery_item.dart';

class GroceryService {
  final List<GroceryItem> _items = [];

  List<GroceryItem> get items => List.unmodifiable(_items);

  void addItem(GroceryItem item) => _items.add(item);

  void removeItem(GroceryItem item) => _items.remove(item);
}




  