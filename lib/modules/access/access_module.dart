import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ws_car/modules/access/login/login_page.dart';
import 'package:ws_car/modules/access/login/login_store.dart';
import 'package:ws_car/modules/access/singup/singup_page.dart';
import 'package:ws_car/modules/access/singup/singup_store.dart';

class AccessModule extends Module {
  @override
  void binds(i) {
    i.add<LoginStore>(LoginStore.new);
    i.add<SingupStore>(SingupStore.new);
    i.add<FirebaseAuth>(() => FirebaseAuth.instance);
  }

  @override
  void routes(r) {
    r.child(
      "/",
      child: (context) => const LoginPage(),
    );

    r.child(
      "/singup",
      child: (context) => const SingupPage(),
    );
  }
}
