// ignore_for_file: prefer_typing_uninitialized_variables, unused_field, unnecessary_new, non_constant_identifier_names

import 'package:projeto_tcc_teste_sacolejando/src/constants/api.dart';
import 'package:projeto_tcc_teste_sacolejando/src/data/network/dio_cliente.dart';

class OrderRepository {
  var _httpClient;

  OrderRepository() {
    _httpClient = DioClient();
  }

  Future createOrder(String tokenCompany, List<Map<String, dynamic>> foods,
      String adress, String payment,
      {required String comments}) async {
    final response =
        await _httpClient.post("/auth/$API_VERSION/orders", formData: {
      'token_company': tokenCompany,
      'foods': foods,
      'comments': comments,
      'adress': adress,
      'payment': payment,
    });

    return response;
  }

  Future<List<dynamic>> getMyOrders() async {
    final response = await _httpClient.get("/auth/$API_VERSION/my-orders");

    return (response.data['data'] as List).toList();
  }
}
