// ignore_for_file: prefer_typing_uninitialized_variables, unused_field, unnecessary_new

import 'package:projeto_tcc_teste_sacolejando/src/constants/api.dart';
import 'package:projeto_tcc_teste_sacolejando/src/data/network/dio_cliente.dart';

class FoodRepository {
  var _httpClient;

  FoodRepository() {
    _httpClient = DioClient();
  }

  Future<List<dynamic>> getFoods(String tokenCompany,
      {List<String>? filterCategories}) async {
    final response =
        await _httpClient.get("$API_VERSION/foods", queryParameters: {
      'token_company': tokenCompany,
      'categories': (filterCategories != null && filterCategories.isNotEmpty)
          ? filterCategories
          : []
    });

    return (response.data['data'] as List).toList();
  }
}
