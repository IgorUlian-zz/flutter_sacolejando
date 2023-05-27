// ignore_for_file: unnecessary_new, unused_field, prefer_typing_uninitialized_variables, no_leading_underscores_for_local_identifiers

import 'package:projeto_tcc_teste_sacolejando/src/constants/api.dart';
import 'package:projeto_tcc_teste_sacolejando/src/data/network/dio_cliente.dart';
import 'package:projeto_tcc_teste_sacolejando/src/models/restaurants_model.dart';

class RestaurantRepository {
  var _httpClient;

  RestaurantRepository() {
    _httpClient = new DioClient();
  }

  Future<List<Restaurant>> getRestaurants() async {
    final response = await _httpClient.get('$API_VERSION/tenants');
    final _restaurants = (response.data['data'] as List).map((restaurant) {
      return Restaurant.fromJson(restaurant);
    }).toList();

    return _restaurants;
  }
}
