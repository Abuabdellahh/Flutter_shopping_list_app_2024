import 'package:shopping_list/utils/env.dart';

class AppConstants {
  static const String appTitle = 'Flutter Groceries';
  static const String groceriesScreenTitle = 'Your Groceries';
  static const String newItemScreenTitle = 'Add a new item';
  static const String emptyListMessage = 'No items added yet.';
  static const double defaultPadding = 12.0;
  static const double colorSwatchSize = 24.0;
  static const double dropdownColorSize = 16.0;

  static const String firebaseBaseUrl = Env.firebaseBaseUrl;
}
