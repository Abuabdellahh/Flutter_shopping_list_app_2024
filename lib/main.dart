import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shopping_list/providers/grocery_provider.dart';
import 'package:shopping_list/screens/grocery_list_screen.dart';
import 'package:shopping_list/theme/app_theme.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => GroceryProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Groceries',
      theme: AppTheme.darkTheme,
      home: const GroceryListScreen(),
    );
  }
}
