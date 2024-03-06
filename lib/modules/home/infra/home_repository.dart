import 'package:dio/dio.dart';
import 'package:ws_car/modules/home/infra/car_model.dart';

abstract class HomeRepository {
  Future<List<CarModel>> getCars();
}

class HomeRepositoryImpl implements HomeRepository {
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
