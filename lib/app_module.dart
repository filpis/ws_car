import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ws_car/home/home_page.dart';
import 'package:ws_car/home/home_store.dart';
import 'package:ws_car/home/infra/home_repository.dart';
import 'package:ws_car/modules/access/login_page.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.add<HomeStore>(HomeStore.new);
    i.add<HomeRepositoryImpl>(HomeRepositoryImpl.new);
    i.add<Dio>(Dio.new);
  }

  @override
  void routes(r) {
    r.child(
      "/",
      child: (context) => const LoginPage(),
    );
    r.child(
      "/home",
      child: (context) => const HomePage(),
    );
  }
}
