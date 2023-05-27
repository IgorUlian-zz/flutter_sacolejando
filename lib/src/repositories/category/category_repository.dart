// ignore_for_file: prefer_typing_uninitialized_variables, unused_field, unnecessary_new

import 'package:projeto_tcc_teste_sacolejando/src/constants/api.dart';
import 'package:projeto_tcc_teste_sacolejando/src/data/network/dio_cliente.dart';

class CategoryRepository {
  var _httpClient;

  CategoryRepository() {
    _httpClient = DioClient();
  }

  Future<List<dynamic>> getCategories(String tokenCompany) async {
    final response = await _httpClient.get("$API_VERSION/categories",
        queryParameters: {'token_company': tokenCompany});

    return (response.data['data'] as List).toList();
  }
}
