// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OrderStore on _OrderStoreBase, Store {
  late final _$isCreateOrderAtom =
      Atom(name: '_OrderStoreBase.isCreateOrder', context: context);

  @override
  bool get isCreateOrder {
    _$isCreateOrderAtom.reportRead();
    return super.isCreateOrder;
  }

  @override
  set isCreateOrder(bool value) {
    _$isCreateOrderAtom.reportWrite(value, super.isCreateOrder, () {
      super.isCreateOrder = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_OrderStoreBase.isLoading', context: context);

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

  late final _$ordersAtom =
      Atom(name: '_OrderStoreBase.orders', context: context);

  @override
  ObservableList<Order> get orders {
    _$ordersAtom.reportRead();
    return super.orders;
  }

  @override
  set orders(ObservableList<Order> value) {
    _$ordersAtom.reportWrite(value, super.orders, () {
      super.orders = value;
    });
  }

  late final _$createOrderAsyncAction =
      AsyncAction('_OrderStoreBase.createOrder', context: context);

  @override
  Future<dynamic> createOrder(String tokenCompany,
      List<Map<String, dynamic>> foods, String adress, String payment,
      {required String comments}) {
    return _$createOrderAsyncAction.run(() => super
        .createOrder(tokenCompany, foods, adress, payment, comments: comments));
  }

  late final _$getMyOrdersAsyncAction =
      AsyncAction('_OrderStoreBase.getMyOrders', context: context);

  @override
  Future<dynamic> getMyOrders() {
    return _$getMyOrdersAsyncAction.run(() => super.getMyOrders());
  }

  late final _$evaluationOrderAsyncAction =
      AsyncAction('_OrderStoreBase.evaluationOrder', context: context);

  @override
  Future<dynamic> evaluationOrder(String identifyOrder, int stars,
      {required String comment}) {
    return _$evaluationOrderAsyncAction.run(
        () => super.evaluationOrder(identifyOrder, stars, comment: comment));
  }

  late final _$_OrderStoreBaseActionController =
      ActionController(name: '_OrderStoreBase', context: context);

  @override
  void addOrder(Order order) {
    final _$actionInfo = _$_OrderStoreBaseActionController.startAction(
        name: '_OrderStoreBase.addOrder');
    try {
      return super.addOrder(order);
    } finally {
      _$_OrderStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearOrder() {
    final _$actionInfo = _$_OrderStoreBaseActionController.startAction(
        name: '_OrderStoreBase.clearOrder');
    try {
      return super.clearOrder();
    } finally {
      _$_OrderStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isCreateOrder: ${isCreateOrder},
isLoading: ${isLoading},
orders: ${orders}
    ''';
  }
}
