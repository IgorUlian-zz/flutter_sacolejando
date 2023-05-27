// ignore_for_file: library_private_types_in_public_api, avoid_init_to_null

import 'package:mobx/mobx.dart';
import 'package:projeto_tcc_teste_sacolejando/src/models/restaurants_model.dart';
part 'restaurant_store.g.dart';

class RestaurantStore = _RestaurantStoreBase with _$RestaurantStore;

abstract class _RestaurantStoreBase with Store {
  @observable
  Restaurant? restaurant = null;

  @action
  void setRestaurant(Restaurant value) => restaurant = value;
}
