import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ws_car/modules/access/access_module.dart';
import 'package:ws_car/modules/home/home_module.dart';
import 'package:ws_car/modules/splash/splash_page.dart';
import 'package:ws_car/modules/splash/splash_store.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.add<Dio>(Dio.new);
    i.add(SplashStore.new);
  }

  @override
  void routes(r) {
    r.child(
      "/",
      child: (context) => const SplashPage(),
    );
    r.module(
      "/access",
      module: AccessModule(),
    );

    r.module(
      "/home",
      module: HomeModule(),
    );
  }
}
