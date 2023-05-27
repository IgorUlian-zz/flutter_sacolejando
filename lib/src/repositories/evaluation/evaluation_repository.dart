// ignore_for_file: prefer_typing_uninitialized_variables, unused_field, unnecessary_new, non_constant_identifier_names

import 'package:projeto_tcc_teste_sacolejando/src/constants/api.dart';
import 'package:projeto_tcc_teste_sacolejando/src/data/network/dio_cliente.dart';

class EvaluationRepository {
  var _httpClient;

  EvaluationRepository() {
    _httpClient = DioClient();
  }

  Future evaluationOrder(String identifyOrder, int stars,
      {required String comment}) async {
    final response = await _httpClient.post(
        "/auth/$API_VERSION/orders/$identifyOrder/evaluations",
        formData: {
          'identify': identifyOrder,
          'stars': stars,
          'comment': comment
        });

    return response;
  }
}
