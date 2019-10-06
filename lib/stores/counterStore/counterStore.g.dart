// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counterStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CounterStore on _CounterStore, Store {
  final _$valueAtom = Atom(name: '_CounterStore.value');

  @override
  int get value {
    _$valueAtom.context.enforceReadPolicy(_$valueAtom);
    _$valueAtom.reportObserved();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.context.conditionallyRunInAction(() {
      super.value = value;
      _$valueAtom.reportChanged();
    }, _$valueAtom, name: '${_$valueAtom.name}_set');
  }

  final _$fetchDataAsyncAction = AsyncAction('fetchData');

  @override
  Future<void> fetchData() {
    return _$fetchDataAsyncAction.run(() => super.fetchData());
  }

  final _$_CounterStoreActionController =
      ActionController(name: '_CounterStore');

  @override
  void increment() {
    final _$actionInfo = _$_CounterStoreActionController.startAction();
    try {
      return super.increment();
    } finally {
      _$_CounterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrement() {
    final _$actionInfo = _$_CounterStoreActionController.startAction();
    try {
      return super.decrement();
    } finally {
      _$_CounterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void set(int value) {
    final _$actionInfo = _$_CounterStoreActionController.startAction();
    try {
      return super.set(value);
    } finally {
      _$_CounterStoreActionController.endAction(_$actionInfo);
    }
  }
}
