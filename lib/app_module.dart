import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ws_car/modules/access/access_module.dart';
import 'package:ws_car/modules/home/home_module.dart';
import 'package:ws_car/modules/home/pages/home_page.dart';
import 'package:ws_car/modules/home/pages/home_store.dart';
import 'package:ws_car/modules/home/infra/home_repository.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.add<Dio>(Dio.new);
  }

  @override
  void routes(r) {
    r.module(
      "/",
      module: AccessModule(),
    );

    r.module(
      "/home",
      module: HomeModule(),
    );
  }
}
