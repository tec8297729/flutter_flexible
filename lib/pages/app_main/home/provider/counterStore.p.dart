import 'package:flutter/material.dart';

class CounterStore extends ChangeNotifier {
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
