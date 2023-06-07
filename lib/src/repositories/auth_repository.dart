// ignore_for_file: avoid_print, non_constant_identifier_names

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:projeto_tcc_teste_sacolejando/src/data/interceptor/dio_interceptor_auth.dart';
import 'package:projeto_tcc_teste_sacolejando/src/data/network/dio_cliente.dart';
import 'package:projeto_tcc_teste_sacolejando/src/models/client_model.dart';

class AuthRepository {
  final Dio _dio = dioInterceptorAuth();
  FlutterSecureStorage storage = const FlutterSecureStorage();

  Future auth(String client_email, String password) async {
    final response = await _dio.post('/auth/token', data: {
      'client_email': client_email,
      'password': password,
      'device_name': 'Teste sacolejando',
    });

    saveToken(response.data['token']);

    return response;
  }

  Future register(String client_name, String client_email, String password,
      String contact) async {
    final response = await _dio.post('/auth/register', data: {
      'client_name': client_name,
      'client_email': client_email,
      'password': password,
      'contact': contact,
    });

    return response;
  }

  Future<Client> getMe() async {
    final String? token = await storage.read(key: 'token_sanctum');
    if (token != null) {
      _dio.options.headers['content-Type'] = 'application/json';
      _dio.options.headers["authorization"] = "Bearer $token";
    }

    final response = await _dio.get('/auth/recoverMe');

    return Client.fromJson(response.data['data']);
  }

  Future saveToken(String token) async {
    await storage.write(key: 'token_sanctum', value: token);
  }

  Future logout() async {
    await DioClient().post('/auth/logout');

    await deleteToken();
  }

  Future deleteToken() async {
    await storage.delete(key: 'token_sanctum');
  }
}
