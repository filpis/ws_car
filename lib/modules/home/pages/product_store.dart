import 'package:mobx/mobx.dart';

import 'package:ws_car/core/local_storage/local_storage.dart';
import 'package:ws_car/modules/home/infra/models/car_model.dart';
import 'package:ws_car/modules/home/infra/models/saved_car_model.dart';

part 'product_store.g.dart';

class ProductStore = _ProductStoreBase with _$ProductStore;

abstract class _ProductStoreBase with Store {
  final LocalStorage _storage;

  _ProductStoreBase(
    this._storage,
  );

  Future<void> buy(SaveBuyModel car) async {
    _storage.saveBuy(car);
  }
}
