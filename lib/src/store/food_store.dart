// ignore_for_file: library_private_types_in_public_api, unnecessary_new

import 'package:mobx/mobx.dart';
import 'package:projeto_tcc_teste_sacolejando/src/models/food_model.dart';
import 'package:projeto_tcc_teste_sacolejando/src/repositories/food/food_repository.dart';

part 'food_store.g.dart';

class FoodStore = _FoodStoreBase with _$FoodStore;

abstract class _FoodStoreBase with Store {
  late FoodRepository _repository;

  _FoodStoreBase() {
    _repository = FoodRepository();
  }

  @observable
  ObservableList<Food> listFoods = ObservableList<Food>();

  @observable
  bool isLoading = false;

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
  Future getFoods(String tokenCompany) async {
    setLoading(true);
    final response = await _repository.getFoods(tokenCompany);
    setLoading(false);
    response.map((food) => addFood(Food.fromJson(food))).toList();
  }
}
