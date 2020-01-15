import 'package:flutter/material.dart';

class CounterStore with ChangeNotifier {
  int value = 10;
  void increment() {
    value++;
    notifyListeners();
  }

  void decrement() {
    value--;
    notifyListeners();
  }

  void set(int value) {
    this.value = value;
  }
}
