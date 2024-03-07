import 'package:mobx/mobx.dart';

import 'package:ws_car/core/utils/local_storage/local_storage.dart';
import 'package:ws_car/modules/home/infra/car_model.dart';

part 'product_store.g.dart';

class ProductStore = _ProductStoreBase with _$ProductStore;

abstract class _ProductStoreBase with Store {
  LocalStorage _storage;

  _ProductStoreBase(
    this._storage,
  );

  Future<void> buy(CarModel car) async {
    _storage.saveBuy(car);
  }
}
