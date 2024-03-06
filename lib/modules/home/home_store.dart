import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'package:ws_car/modules/home/infra/car_model.dart';
import 'package:ws_car/modules/home/infra/home_repository.dart';

part 'home_store.g.dart';

enum HomeState {
  initial,
  loading,
  success,
  failed,
}

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final HomeRepositoryImpl repository;

  _HomeStoreBase(
    this.repository,
  );

  @readonly
  var _state = HomeState.initial;

  @observable
  List<CarModel>? cars;

  @action
  Future<void> getCars() async {
    _state = HomeState.loading;
    try {
      cars = await repository.getCars();
      _state = HomeState.success;
    } catch (e) {
      _state = HomeState.failed;
      rethrow;
    }
  }
}
