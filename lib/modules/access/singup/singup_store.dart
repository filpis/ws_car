import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
part 'singup_store.g.dart';

enum SingupState {
  initial,
  loading,
  success,
  failed,
}

class SingupStore = _SingupStoreBase with _$SingupStore;

abstract class _SingupStoreBase with Store {
  @readonly
  var _state = SingupState.initial;

  Future<User?> singup(String user, String password) async {
    _state = SingupState.loading;
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user,
        password: password,
      );
      _state = SingupState.success;

      return userCredential.user;
    } catch (e) {
      _state = SingupState.failed;

      log(e.toString());
      rethrow;
    }
  }
}
