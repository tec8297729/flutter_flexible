import 'package:flutter/material.dart';

class CounterProvideStore with ChangeNotifier {
  int _counter = 10;
  int get counter => _counter;

  set counter(int val) {
    _counter = val;
    notifyListeners();
  }

  increment() {
    counter++;
  }
}
