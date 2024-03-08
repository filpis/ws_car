import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'splash_store.g.dart';

class SplashStore = _SplashStoreBase with _$SplashStore;

abstract class _SplashStoreBase with Store {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> manageSplash() async {
    await Future.delayed(const Duration(milliseconds: 1400));
    if (_auth.currentUser != null) {
      Modular.to.pushNamed("home");
      log('Usuário logado: ${_auth.currentUser!.email}');
    } else {
      Modular.to.pushNamed("../access");
      log('Usuário não está logado');
    }
  }
}
