import 'package:flutter/material.dart';

class CounterModel extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  // moved items here so provider can manage it
  final List<Map<String, dynamic>> items = List.generate(
    20,
        (i) => {'item': i + 1, 'isActive': false},
  );

  void toggleFavorite(int index) {
    items[index]['isActive'] = !items[index]['isActive'];
    notifyListeners();
  }

  void increment() {
    _count++;
    notifyListeners();
  }

  void reset() {
    _count = 0;
    notifyListeners();
  }
}