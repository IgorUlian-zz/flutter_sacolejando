// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import 'package:projeto_tcc_teste_sacolejando/src/repositories/orders/order_repository.dart';
part 'order_store.g.dart';

class OrderStore = _OrderStoreBase with _$OrderStore;

abstract class _OrderStoreBase with Store {
  final OrderRepository _orderRepository = OrderRepository();

  @observable
  bool isCreateOrder = false;

  @action
  Future createOrder(String tokenCompany, List<Map<String, dynamic>> foods,
      {String? order_comment}) async {
    isCreateOrder = true;
    await _orderRepository.createOrder(tokenCompany, foods,
        order_comment: order_comment);
    isCreateOrder = false;
  }
}
