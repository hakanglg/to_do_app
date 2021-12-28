import 'package:flutter/material.dart';

import 'item.dart';

class ItemData with ChangeNotifier {
  final List<Item> items = [
    Item(title: 'Peynir al'),
    Item(title: 'bira al'),
    Item(title: 'kola al'),
  ];

  void toggletatus(int index) {
    items[index].toggleStatus();
    notifyListeners();
  }

  void addItem(String title) {
    items.add(Item(title: title));
    notifyListeners();
  }

  void deleteItem(int index) {
    items.removeAt(index);
    notifyListeners();
  }
}
