import 'package:flutter/material.dart';

class CounterStore extends ChangeNotifier {
  int value = 10;
  bool isLoading = false;
  String fetchResult = '';
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

  void setLoading(bool flag) {
    isLoading = flag;
    notifyListeners();
  }

  void setFetchResult(String s) {
    fetchResult = s;
    notifyListeners();
  }
}
