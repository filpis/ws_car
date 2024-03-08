import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ws_car/core/local_storage/local_storage.dart';
import 'package:ws_car/modules/access/login/login_store.dart';
import 'package:ws_car/modules/home/infra/repositories/product_repository.dart';
import 'package:ws_car/modules/home/pages/home_page.dart';
import 'package:ws_car/modules/home/pages/home_store.dart';
import 'package:ws_car/modules/home/pages/product_page.dart';
import 'package:ws_car/modules/home/pages/product_store.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    i.add<HomeStore>(HomeStore.new);
    i.add<ProductRepositoryImpl>(ProductRepositoryImpl.new);
    i.add(LocalStorage.new);
    i.add(LoginStore.new);
    i.add(ProductStore.new);
    i.add<FirebaseAuth>(() => FirebaseAuth.instance);
  }

  @override
  void routes(r) {
    r.child(
      "/",
      child: (context) => const HomePage(),
    );

    r.child(
      "/product",
      child: (_) => ProductPage(
        car: r.args.data["car"],
      ),
    );
  }
}
