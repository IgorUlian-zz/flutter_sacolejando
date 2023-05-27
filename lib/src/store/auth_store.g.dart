// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on _AuthStoreBase, Store {
  late final _$clientAtom =
      Atom(name: '_AuthStoreBase.client', context: context);

  @override
  Client? get client {
    _$clientAtom.reportRead();
    return super.client;
  }

  @override
  set client(Client? value) {
    _$clientAtom.reportWrite(value, super.client, () {
      super.client = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_AuthStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$authAsyncAction =
      AsyncAction('_AuthStoreBase.auth', context: context);

  @override
  Future<dynamic> auth(String client_email, String password) {
    return _$authAsyncAction.run(() => super.auth(client_email, password));
  }

  late final _$registerAsyncAction =
      AsyncAction('_AuthStoreBase.register', context: context);

  @override
  Future<dynamic> register(
      String client_name, String client_email, String password) {
    return _$registerAsyncAction
        .run(() => super.register(client_name, client_email, password));
  }

  late final _$getMeAsyncAction =
      AsyncAction('_AuthStoreBase.getMe', context: context);

  @override
  Future<bool> getMe() {
    return _$getMeAsyncAction.run(() => super.getMe());
  }

  late final _$logoutAsyncAction =
      AsyncAction('_AuthStoreBase.logout', context: context);

  @override
  Future<dynamic> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  late final _$_AuthStoreBaseActionController =
      ActionController(name: '_AuthStoreBase', context: context);

  @override
  void setClient(Client value) {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.setClient');
    try {
      return super.setClient(value);
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
client: ${client},
isLoading: ${isLoading}
    ''';
  }
}
