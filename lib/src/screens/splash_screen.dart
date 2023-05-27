// ignore_for_file: prefer_const_constructors, unused_local_variable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:projeto_tcc_teste_sacolejando/src/store/auth_store.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

// ignore: camel_case_types
class _SplashScreenState extends State<SplashScreen> {
  late AuthStore _authStore;
  FlutterSecureStorage storage = FlutterSecureStorage();

  @override
  void initState() {
    super.initState();

    /*Future.delayed(Duration(seconds: 3))
        .then((_) => Navigator.of(context).pushReplacementNamed('/login'));*/

    _checkAuth()
        .then((value) => Navigator.pushReplacementNamed(context, '/restaurant'))
        .catchError(
            (error) => Navigator.pushReplacementNamed(context, '/login'));
  }

  @override
  Widget build(BuildContext context) {
    _authStore = Provider.of<AuthStore>(context);
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(color: Color.fromARGB(255, 180, 0, 0)),
      ),
    );
  }

  Future _checkAuth() async {
    final String? token = await storage.read(key: 'token_sanctum');

    if (token != null) {
      return await _authStore
          .getMe()
          .then((value) => Future.value())
          .catchError((error) async {
        await storage.delete(key: 'token_sanctum');

        return Future.error({});
      });
    }

    return Future.error({});
  }
}
