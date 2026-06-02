import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/providers/grocery_provider.dart';
import 'package:shopping_list/utils/constants.dart';
import 'package:shopping_list/screens/new_item_screen.dart';

class GroceryListScreen extends StatefulWidget {
  const GroceryListScreen({super.key});

  @override
  State<GroceryListScreen> createState() => _GroceryListScreenState();
}

class _GroceryListScreenState extends State<GroceryListScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<GroceryProvider>().loadItems(),
    );
  }

  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(builder: (ctx) => const NewItemScreen()),
    );
    if (newItem == null || !mounted) return;
    await context.read<GroceryProvider>().addItem(newItem);
  }

  void _removeItem(GroceryItem item) {
    context.read<GroceryProvider>().removeItem(item);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.groceriesScreenTitle),
        actions: [
          IconButton(onPressed: _addItem, icon: const Icon(Icons.add)),
        ],
      ),
      body: Consumer<GroceryProvider>(
        builder: (ctx, provider, _) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.error != null) {
            return Center(child: Text(provider.error!));
          }

          if (provider.items.isEmpty) {
            return const Center(
              child: Text(AppConstants.emptyListMessage),
            );
          }

          return ListView.builder(
            itemCount: provider.items.length,
            itemBuilder: (ctx, index) {
              final item = provider.items[index];
              return Dismissible(
                key: ValueKey(item.id),
                onDismissed: (_) => _removeItem(item),
                child: ListTile(
                  title: Text(item.name),
                  leading: Container(
                    width: AppConstants.colorSwatchSize,
                    height: AppConstants.colorSwatchSize,
                    color: item.category.color,
                  ),
                  trailing: Text(item.quantity.toString()),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
