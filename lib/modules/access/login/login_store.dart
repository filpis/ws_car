// ignore_for_file: library_private_types_in_public_api

import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

enum LoginState {
  initial,
  loading,
  success,
  failed,
}

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  FirebaseAuth auth = FirebaseAuth.instance;
  _LoginStoreBase(
    this.auth,
  );

  @readonly
  var _state = LoginState.initial;

  @action
  Future<void> login(String user, String password) async {
    _state = LoginState.loading;

    try {
      await auth.signInWithEmailAndPassword(email: user, password: password);
      _state = LoginState.success;
    } catch (e) {
      log(e.toString());

      _state = LoginState.failed;
    }
  }
}
