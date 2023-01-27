// ignore_for_file: prefer_typing_uninitialized_variables, unused_field

import 'package:projeto_tcc_teste_sacolejando/src/data/network/dio_cliente.dart';
import 'package:projeto_tcc_teste_sacolejando/src/models/food_model.dart';

class FoodRepository {
  var _httpClient;

  FoodRepository() {
    _httpClient = DioClient();
  }

  Future<List<Food>> getFoods(String tokenCompany) async {
    final response = await _httpClient.get('foods/all');
    final foods = (response.data['data'] as List).map((food) {
      return Food.fromJson(food);
    }).toList();

    return foods;
  }
}
