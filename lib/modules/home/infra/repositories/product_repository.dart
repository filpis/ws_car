import 'package:dio/dio.dart';
import 'package:ws_car/modules/home/infra/models/car_model.dart';

abstract class ProductRepository {
  Future<List<CarModel>> getCars();
}

class ProductRepositoryImpl implements ProductRepository {
  final dio = Dio();

  @override
  Future<List<CarModel>> getCars() async {
    try {
      final response = await dio.get("https://wswork.com.br/cars.json");
      return response.data["cars"].map<CarModel>((c) {
        return CarModel.fromJson(c);
      }).toList();
    } catch (e) {
      rethrow;
    }
  }
}
