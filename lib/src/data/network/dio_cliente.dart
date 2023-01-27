// ignore_for_file: avoid_print, unnecessary_new

import 'package:dio/dio.dart';
import 'package:projeto_tcc_teste_sacolejando/src/data/exceptions/dio_exception.dart';
import 'package:projeto_tcc_teste_sacolejando/src/data/interceptor/dio_interceptor.dart';

class DioClient {
  late Dio _dio;

  DioClient() {
    _dio = dioInterceptor();
  }

  Future<dynamic> get(String url,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final Response response =
          await _dio.get(url, queryParameters: queryParameters);
      print(response);

      return response;
    } on DioError catch (e) {
      Future.error({});

      ApiException(e.response);
    }
  }

  Future<dynamic> post(String url,
      {formData, Map<String, dynamic>? queryParameters}) async {
    try {
      final Response response = await _dio.post(url,
          data: formData, queryParameters: queryParameters);
      print(response);

      return response;
    } on DioError catch (e) {
      Future.error({});

      ApiException(e.response);
    }
  }
}
