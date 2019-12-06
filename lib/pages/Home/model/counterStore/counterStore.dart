import 'package:mobx/mobx.dart';
part 'counterStore.g.dart';

class CounterStore = _CounterStore with _$CounterStore;

abstract class _CounterStore with Store {
  @observable
  int value = 10;

  @action
  void increment() {
    value++;
  }

  @action
  void decrement() {
    value--;
  }

  @action
  void set(int value) {
    this.value = value;
  }
}
