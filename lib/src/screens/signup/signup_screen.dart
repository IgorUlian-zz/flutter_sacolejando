// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, unused_field, sort_child_properties_last, sized_box_for_whitespace, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projeto_tcc_teste_sacolejando/src/store/auth_store.dart';
import 'package:projeto_tcc_teste_sacolejando/src/widgets/logo_sacolejando.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  late double _deviceWidth;
  late double _deviceHeight;

  late AuthStore _authStore;

  final TextEditingController _client_name = TextEditingController();
  final TextEditingController _client_email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _authStore = Provider.of<AuthStore>(context);

    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Observer(
          builder: (context) => _registerUI(context),
        ),
      ),
    );
  }

  Widget _registerUI(context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: _deviceWidth * 0.10),
      child: Column(
        children: <Widget>[
          Container(height: 50),
          const LogoSacolejando(),
          Container(height: 50),
          _formLogin(context),
          Container(height: 15),
          _loginButton(context),
          Container(height: 30),
          _textRegister(context),
        ],
      ),
    );
  }

  Widget _formLogin(context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(119, 119, 119, 0.6),
                blurRadius: 20.0,
                offset: Offset(0, 10))
          ]),
      child: Column(
        children: <Widget>[
          _nameTextField(context),
          _emailTextField(context),
          _passwordTextField(context),
        ],
      ),
    );
  }

  Widget _nameTextField(context) {
    return TextFormField(
      controller: _client_name,
      autocorrect: false,
      autofocus: true,
      style: const TextStyle(color: Color.fromARGB(255, 145, 0, 0)),
      cursorColor: Theme.of(context).primaryColor,
      decoration: const InputDecoration(
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 145, 0, 0)),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 145, 0, 0)),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 145, 0, 0)),
        ),
        contentPadding: EdgeInsets.all(10),
        hintText: 'Nome',
        hintStyle: TextStyle(color: Color.fromARGB(255, 145, 0, 0)),
      ),
    );
  }

  Widget _emailTextField(context) {
    return TextFormField(
      controller: _client_email,
      autocorrect: false,
      autofocus: false,
      style: const TextStyle(color: Color.fromARGB(255, 145, 0, 0)),
      cursorColor: Theme.of(context).primaryColor,
      decoration: const InputDecoration(
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 145, 0, 0)),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 145, 0, 0)),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 145, 0, 0)),
        ),
        contentPadding: EdgeInsets.all(10),
        hintText: 'E-mail',
        hintStyle: TextStyle(color: Color.fromARGB(255, 145, 0, 0)),
      ),
    );
  }

  Widget _passwordTextField(context) {
    return TextFormField(
      controller: _password,
      autocorrect: false,
      autofocus: true,
      obscureText: true,
      style: const TextStyle(color: Color.fromARGB(255, 145, 0, 0)),
      cursorColor: Theme.of(context).primaryColor,
      decoration: const InputDecoration(
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 145, 0, 0)),
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: EdgeInsets.all(10),
          hintText: 'Senha',
          hintStyle: TextStyle(color: Color.fromARGB(255, 145, 0, 0))),
    );
  }

  Widget _loginButton(context) {
    return Container(
      width: _deviceWidth,
      child: MaterialButton(
        onPressed: () => _authStore.isLoading ? null : register(context),
        color: const Color.fromARGB(255, 145, 0, 0),
        child: Text(
          _authStore.isLoading ? 'Cadastrando...' : 'CADASTRAR',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }

  Widget _textRegister(context) {
    return GestureDetector(
      onTap: () {
        //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
        Navigator.pushReplacementNamed(context, '/login');
      },
      child: const Text(
        'Já cadastro? Faça Login!',
        style: TextStyle(color: Color.fromARGB(255, 145, 0, 0), fontSize: 18.2),
      ),
    );
  }

  Future register(context) async {
    await _authStore
        .register(_client_name.text, _client_email.text, _password.text)
        .then(
            (value) => Navigator.pushReplacementNamed(context, '/restaurant'));
  }
}
