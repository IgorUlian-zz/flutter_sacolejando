// ignore_for_file: unnecessary_new, unnecessary_null_comparison, prefer_interpolation_to_compose_strings

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:projeto_tcc_teste_sacolejando/src/constants/api.dart';

FlutterSecureStorage storage = const FlutterSecureStorage();

Dio dio = new Dio();

Dio dioInterceptor() {
  // Set default configs
  dio.options.baseUrl = API_URL;
  dio.options.connectTimeout = API_CONNECTION_TIMEOUT; //5s
  dio.options.receiveTimeout = API_RECEIVE_TIMEOUT;

  dio.options.headers['Accept'] = 'application/json';

  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) async {
      final String? token = await storage.read(key: 'token_sanctum');
      if (token != null) {
        dio.options.headers['Authorization'] = 'Bearer ' + token;
      }
      return handler.next(options);
    },
  ));
  return dio;
}
