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

  late final _$createOrderAsyncAction =
      AsyncAction('_OrderStoreBase.createOrder', context: context);

  @override
  Future<dynamic> createOrder(
      String tokenCompany, List<Map<String, dynamic>> foods,
      {String? order_comment}) {
    return _$createOrderAsyncAction.run(() =>
        super.createOrder(tokenCompany, foods, order_comment: order_comment));
  }

  @override
  String toString() {
    return '''
isCreateOrder: ${isCreateOrder}
    ''';
  }
}
