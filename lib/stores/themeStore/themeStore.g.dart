// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'themeStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ThemeStore on _ThemeStore, Store {
  Computed<ThemeData> _$getThemeComputed;

  @override
  ThemeData get getTheme =>
      (_$getThemeComputed ??= Computed<ThemeData>(() => super.getTheme)).value;

  final _$_themeDataAtom = Atom(name: '_ThemeStore._themeData');

  @override
  ThemeData get _themeData {
    _$_themeDataAtom.context.enforceReadPolicy(_$_themeDataAtom);
    _$_themeDataAtom.reportObserved();
    return super._themeData;
  }

  @override
  set _themeData(ThemeData value) {
    _$_themeDataAtom.context.conditionallyRunInAction(() {
      super._themeData = value;
      _$_themeDataAtom.reportChanged();
    }, _$_themeDataAtom, name: '${_$_themeDataAtom.name}_set');
  }

  final _$_ThemeStoreActionController = ActionController(name: '_ThemeStore');

  @override
  void setTheme(ThemeData themeName) {
    final _$actionInfo = _$_ThemeStoreActionController.startAction();
    try {
      return super.setTheme(themeName);
    } finally {
      _$_ThemeStoreActionController.endAction(_$actionInfo);
    }
  }
}
