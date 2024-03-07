// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStoreBase, Store {
  late final _$_stateAtom =
      Atom(name: '_HomeStoreBase._state', context: context);

  HomeState get state {
    _$_stateAtom.reportRead();
    return super._state;
  }

  @override
  HomeState get _state => state;

  @override
  set _state(HomeState value) {
    _$_stateAtom.reportWrite(value, super._state, () {
      super._state = value;
    });
  }

  late final _$carsAtom = Atom(name: '_HomeStoreBase.cars', context: context);

  @override
  List<CarModel>? get cars {
    _$carsAtom.reportRead();
    return super.cars;
  }

  @override
  set cars(List<CarModel>? value) {
    _$carsAtom.reportWrite(value, super.cars, () {
      super.cars = value;
    });
  }

  late final _$getCarsAsyncAction =
      AsyncAction('_HomeStoreBase.getCars', context: context);

  @override
  Future<void> getCars() {
    return _$getCarsAsyncAction.run(() => super.getCars());
  }

  @override
  String toString() {
    return '''
cars: ${cars}
    ''';
  }
}
