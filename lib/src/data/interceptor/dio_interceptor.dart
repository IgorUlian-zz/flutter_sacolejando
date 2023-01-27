// ignore_for_file: unnecessary_new

import 'package:dio/dio.dart';
import 'package:projeto_tcc_teste_sacolejando/src/constants/api.dart';

Dio dioInterceptor() {
  Dio dio = new Dio();

//Set configurations for dio
  dio.options.baseUrl = API_URL;
  dio.options.connectTimeout = API_CONNECTION_TIMEOUT;
  dio.options.receiveTimeout = API_RECEIVE_TIMEOUT;
  return dio;
}
