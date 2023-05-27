// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FoodStore on _FoodStoreBase, Store {
  late final _$listFoodsAtom =
      Atom(name: '_FoodStoreBase.listFoods', context: context);

  @override
  ObservableList<Food> get listFoods {
    _$listFoodsAtom.reportRead();
    return super.listFoods;
  }

  @override
  set listFoods(ObservableList<Food> value) {
    _$listFoodsAtom.reportWrite(value, super.listFoods, () {
      super.listFoods = value;
    });
  }

  late final _$cartItemsAtom =
      Atom(name: '_FoodStoreBase.cartItems', context: context);

  @override
  List<Map<String, dynamic>> get cartItems {
    _$cartItemsAtom.reportRead();
    return super.cartItems;
  }

  @override
  set cartItems(List<Map<String, dynamic>> value) {
    _$cartItemsAtom.reportWrite(value, super.cartItems, () {
      super.cartItems = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_FoodStoreBase.isLoading', context: context);

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

  late final _$totalCartAtom =
      Atom(name: '_FoodStoreBase.totalCart', context: context);

  @override
  double get totalCart {
    _$totalCartAtom.reportRead();
    return super.totalCart;
  }

  @override
  set totalCart(double value) {
    _$totalCartAtom.reportWrite(value, super.totalCart, () {
      super.totalCart = value;
    });
  }

  late final _$getFoodsAsyncAction =
      AsyncAction('_FoodStoreBase.getFoods', context: context);

  @override
  Future<dynamic> getFoods(String tokenCompany,
      {List<String>? categoriesFilter}) {
    return _$getFoodsAsyncAction.run(
        () => super.getFoods(tokenCompany, categoriesFilter: categoriesFilter));
  }

  late final _$_FoodStoreBaseActionController =
      ActionController(name: '_FoodStoreBase', context: context);

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_FoodStoreBaseActionController.startAction(
        name: '_FoodStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_FoodStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addAll(List<Food> listFoods) {
    final _$actionInfo = _$_FoodStoreBaseActionController.startAction(
        name: '_FoodStoreBase.addAll');
    try {
      return super.addAll(listFoods);
    } finally {
      _$_FoodStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addFood(Food food) {
    final _$actionInfo = _$_FoodStoreBaseActionController.startAction(
        name: '_FoodStoreBase.addFood');
    try {
      return super.addFood(food);
    } finally {
      _$_FoodStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeFood(Food food) {
    final _$actionInfo = _$_FoodStoreBaseActionController.startAction(
        name: '_FoodStoreBase.removeFood');
    try {
      return super.removeFood(food);
    } finally {
      _$_FoodStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearFood() {
    final _$actionInfo = _$_FoodStoreBaseActionController.startAction(
        name: '_FoodStoreBase.clearFood');
    try {
      return super.clearFood();
    } finally {
      _$_FoodStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addFoodCart(Food food) {
    final _$actionInfo = _$_FoodStoreBaseActionController.startAction(
        name: '_FoodStoreBase.addFoodCart');
    try {
      return super.addFoodCart(food);
    } finally {
      _$_FoodStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeFoodCart(Food food) {
    final _$actionInfo = _$_FoodStoreBaseActionController.startAction(
        name: '_FoodStoreBase.removeFoodCart');
    try {
      return super.removeFoodCart(food);
    } finally {
      _$_FoodStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearCart() {
    final _$actionInfo = _$_FoodStoreBaseActionController.startAction(
        name: '_FoodStoreBase.clearCart');
    try {
      return super.clearCart();
    } finally {
      _$_FoodStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void incrementFoodCart(Food food) {
    final _$actionInfo = _$_FoodStoreBaseActionController.startAction(
        name: '_FoodStoreBase.incrementFoodCart');
    try {
      return super.incrementFoodCart(food);
    } finally {
      _$_FoodStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrementFoodCart(Food food) {
    final _$actionInfo = _$_FoodStoreBaseActionController.startAction(
        name: '_FoodStoreBase.decrementFoodCart');
    try {
      return super.decrementFoodCart(food);
    } finally {
      _$_FoodStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool inFoodCart(Food food) {
    final _$actionInfo = _$_FoodStoreBaseActionController.startAction(
        name: '_FoodStoreBase.inFoodCart');
    try {
      return super.inFoodCart(food);
    } finally {
      _$_FoodStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  double resultTotalCart() {
    final _$actionInfo = _$_FoodStoreBaseActionController.startAction(
        name: '_FoodStoreBase.resultTotalCart');
    try {
      return super.resultTotalCart();
    } finally {
      _$_FoodStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listFoods: ${listFoods},
cartItems: ${cartItems},
isLoading: ${isLoading},
totalCart: ${totalCart}
    ''';
  }
}
