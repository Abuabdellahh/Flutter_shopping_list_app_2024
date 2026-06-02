import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/utils/constants.dart';

class GroceryService {
  static final Uri _url = Uri.parse(
    '${AppConstants.firebaseBaseUrl}/shopping-list.json',
  );

  Future<List<GroceryItem>> fetchItems() async {
    final response = await http.get(_url);

    if (response.body == 'null') return [];

    final Map<String, dynamic> data = json.decode(response.body);

    return data.entries.map((entry) {
      final categoryEntry = categories.entries.firstWhere(
        (c) => c.value.title == entry.value['category'],
      );
      return GroceryItem(
        id: entry.key,
        name: entry.value['name'],
        quantity: entry.value['quantity'],
        category: categoryEntry.value,
      );
    }).toList();
  }

  Future<String> addItem(GroceryItem item) async {
    final response = await http.post(
      _url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'name': item.name,
        'quantity': item.quantity,
        'category': item.category.title,
      }),
    );

    final data = json.decode(response.body);
    return data['name'] as String;
  }

  Future<void> removeItem(String firebaseId) async {
    final uri = Uri.parse(
      '${AppConstants.firebaseBaseUrl}/shopping-list/$firebaseId.json',
    );
    await http.delete(uri);
  }
}
