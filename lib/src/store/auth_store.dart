// ignore_for_file: library_private_types_in_public_api, avoid_print, non_constant_identifier_names

import 'package:mobx/mobx.dart';
import 'package:projeto_tcc_teste_sacolejando/src/models/client_model.dart';
import 'package:projeto_tcc_teste_sacolejando/src/repositories/auth_repository.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final AuthRepository _authRepository = AuthRepository();

  @observable
  Client? client;

  @observable
  bool isLoading = false;

  @action
  void setClient(Client value) => client = value;

  @action
  void setLoading(bool value) => isLoading = value;

  @action
  Future auth(String client_email, String password) async {
    setLoading(true);

    return await _authRepository
        .auth(client_email, password)
        .then((value) async => await getMe())
        .whenComplete(() => setLoading(false));
  }

  @action
  Future register(
      String client_name, String client_email, String password) async {
    setLoading(true);

    return await _authRepository
        .register(client_name, client_email, password)
        .then((value) async => await auth(client_email, password))
        .whenComplete(() => setLoading(false));
  }

  @action
  Future<bool> getMe() async {
    Client client = await _authRepository.getMe();

    setClient(client);

    return true;
  }

  @action
  Future logout() async {
    setLoading(true);
    await _authRepository.logout().whenComplete(() => setLoading(false));
  }
}
