// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import 'package:projeto_tcc_teste_sacolejando/src/models/order_model.dart';
import 'package:projeto_tcc_teste_sacolejando/src/repositories/evaluation/evaluation_repository.dart';
import 'package:projeto_tcc_teste_sacolejando/src/repositories/orders/order_repository.dart';
part 'order_store.g.dart';

class OrderStore = _OrderStoreBase with _$OrderStore;

abstract class _OrderStoreBase with Store {
  final OrderRepository _orderRepository = OrderRepository();
  final EvaluationRepository _evaluationRepository = EvaluationRepository();

  @observable
  bool isCreateOrder = false;

  @observable
  bool isLoading = false;

  @observable
  ObservableList<Order> orders = ObservableList<Order>();

  @action
  Future createOrder(
      String tokenCompany, List<Map<String, dynamic>> foods, String adress, String payment,
      {required String comments}) async {
    isCreateOrder = true;
    await _orderRepository.createOrder(
        tokenCompany, foods, comments: comments, adress, payment);
    isCreateOrder = false;
  }

  @action
  void addOrder(Order order) {
    orders.add(order);
  }

  @action
  void clearOrder() {
    orders.clear();
  }

  @action
  Future getMyOrders() async {
    clearOrder();
    isLoading = true;

    final response = await _orderRepository.getMyOrders();

    response.map((order) => addOrder(Order.fromJson(order))).toList();

    isLoading = false;
  }

  @action
  Future evaluationOrder(String identifyOrder, int stars,
      {required String comment}) async {
    isLoading = true;

    await _evaluationRepository.evaluationOrder(identifyOrder, stars,
        comment: comment);

    isLoading = false;
  }
}
