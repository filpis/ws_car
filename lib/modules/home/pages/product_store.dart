// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mobx/mobx.dart';

import 'package:ws_car/core/local_storage/local_storage.dart';
import 'package:ws_car/modules/home/infra/models/car_model.dart';
import 'package:ws_car/modules/home/infra/models/saved_car_model.dart';

part 'product_store.g.dart';

enum ProducBuyState {
  initial,
  loading,
  success,
  failed,
}

class ProductStore = _ProductStoreBase with _$ProductStore;

abstract class _ProductStoreBase with Store {
  final LocalStorage _storage;

  _ProductStoreBase(
    this._storage,
  );

  @readonly
  var _state = ProducBuyState.initial;

  Future<void> buy(SaveBuyModel car) async {
    _state = ProducBuyState.loading;
    await Future.delayed(const Duration(seconds: 1));

    try {
      await _storage.saveBuy(car);
      _state = ProducBuyState.success;
    } catch (e) {
      _state = ProducBuyState.failed;
      rethrow;
    }
  }
}
