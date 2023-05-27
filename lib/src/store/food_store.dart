// ignore_for_file: library_private_types_in_public_api, unnecessary_new, non_constant_identifier_names, unused_element, slash_for_doc_comments, avoid_print

import 'package:mobx/mobx.dart';
import 'package:projeto_tcc_teste_sacolejando/src/models/food_model.dart';
import 'package:projeto_tcc_teste_sacolejando/src/repositories/food/food_repository.dart';

part 'food_store.g.dart';

class FoodStore = _FoodStoreBase with _$FoodStore;

abstract class _FoodStoreBase with Store {
  late FoodRepository _repository;

  _FoodStoreBase() {
    _repository = new FoodRepository();
  }

  @observable
  ObservableList<Food> listFoods = ObservableList<Food>();

  @observable
  List<Map<String, dynamic>> cartItems = [];
  @observable
  bool isLoading = false;

  @observable
  double totalCart = 0;

  @action
  void setLoading(bool value) {
    isLoading = value;
  }

  @action
  void addAll(List<Food> listFoods) {
    listFoods.addAll(listFoods);
  }

  @action
  void addFood(Food food) {
    listFoods.add(food);
  }

  @action
  void removeFood(Food food) {
    listFoods.remove(food);
  }

  @action
  void clearFood() {
    listFoods.clear();
  }

  @action
  Future getFoods(String tokenCompany, {List<String>? categoriesFilter}) async {
    clearFood();
    //clearCart();

    setLoading(true);

    final response = await _repository.getFoods(tokenCompany,
        filterCategories: categoriesFilter);

    setLoading(false);

    response.map((food) => addFood(Food.fromJson(food))).toList();
  }

  /**
   * Carrinho de compras
   */

  @action
  void addFoodCart(Food food) {
    print('addFoodCart');

    if (inFoodCart(food)) {
      return incrementFoodCart(food);
    }

    cartItems.add({
      'identify': food.identify,
      'quantity': 1,
      'food': food,
    });

    resultTotalCart();
  }

  @action
  void removeFoodCart(Food food) {
    print('removeFoodCart');

    cartItems.removeWhere((element) => element['identify'] == food.identify);

    resultTotalCart();
  }

  @action
  void clearCart() {
    cartItems.clear();

    resultTotalCart();
  }

  @action
  void incrementFoodCart(Food food) {
    final int index =
        cartItems.indexWhere((element) => element['identify'] == food.identify);

    cartItems[index]['quantity'] = cartItems[index]['quantity'] + 1;

    resultTotalCart();
  }

  @action
  void decrementFoodCart(Food food) {
    final int index =
        cartItems.indexWhere((element) => element['identify'] == food.identify);

    cartItems[index]['quantity'] = cartItems[index]['quantity'] - 1;

    if (cartItems[index]['quantity'] == 0) {
      return removeFoodCart(food);
    }

    resultTotalCart();
  }

  @action
  // ignore: iterable_contains_unrelated_type
  bool inFoodCart(Food food) {
    final int index =
        cartItems.indexWhere((element) => element['identify'] == food.identify);

    return index != -1;
  }

  @action
  double resultTotalCart() {
    double total = 0;

    cartItems
        .map((element) =>
            total += element['quantity'] * double.parse(element['food'].price))
        .toList();

    totalCart = total;
    listFoods = listFoods;
    cartItems = cartItems;

    return total;
  }
}
