// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RestaurantStore on _RestaurantStoreBase, Store {
  late final _$restaurantAtom =
      Atom(name: '_RestaurantStoreBase.restaurant', context: context);

  @override
  Restaurant? get restaurant {
    _$restaurantAtom.reportRead();
    return super.restaurant;
  }

  @override
  set restaurant(Restaurant? value) {
    _$restaurantAtom.reportWrite(value, super.restaurant, () {
      super.restaurant = value;
    });
  }

  late final _$_RestaurantStoreBaseActionController =
      ActionController(name: '_RestaurantStoreBase', context: context);

  @override
  void setRestaurant(Restaurant value) {
    final _$actionInfo = _$_RestaurantStoreBaseActionController.startAction(
        name: '_RestaurantStoreBase.setRestaurant');
    try {
      return super.setRestaurant(value);
    } finally {
      _$_RestaurantStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
restaurant: ${restaurant}
    ''';
  }
}
