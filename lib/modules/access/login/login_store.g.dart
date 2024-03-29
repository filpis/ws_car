// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on _LoginStoreBase, Store {
  late final _$_stateAtom =
      Atom(name: '_LoginStoreBase._state', context: context);

  LoginState get state {
    _$_stateAtom.reportRead();
    return super._state;
  }

  @override
  LoginState get _state => state;

  @override
  set _state(LoginState value) {
    _$_stateAtom.reportWrite(value, super._state, () {
      super._state = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('_LoginStoreBase.login', context: context);

  @override
  Future<void> login(String user, String password) {
    return _$loginAsyncAction.run(() => super.login(user, password));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
