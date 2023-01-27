// ignore_for_file: prefer_const_constructors, sort_child_properties_last, avoid_print
import 'package:flutter/material.dart';

import '../../constants/custom_colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => visualization();
}

Color getColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return Color.fromARGB(255, 180, 0, 0);
  }
  return Colors.white;
}

// ignore: camel_case_types
class visualization extends State<SignUpScreen> {
  // para a visualização da senha //
  bool _obscuretext = true;

  // text controllers para o banco
  var controllerName = TextEditingController();
  var controllerEmail = TextEditingController();
  var controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 70,
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 30,
                ),
              ),
              SizedBox(
                height: 10,
              ),

              // PAGINA CADASTRO
              Text(
                "Cadastrando-se",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 145, 0, 0),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Form(
                child: Column(
                  children: [
                    //CADASTRO NOME DO CLIENTE
                    TextFormField(
                      autofocus: true,
                      controller: controllerName,
                      decoration: InputDecoration(
                        labelText: "Nome Completo",
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 145, 0, 0)),
                        prefixIcon: Icon(Icons.person,
                            color: Color.fromARGB(255, 145, 0, 0)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: (BorderSide(
                                color: Color.fromARGB(255, 145, 0, 0)))),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: (BorderSide(
                                color: Color.fromARGB(255, 145, 0, 0)))),
                      ),
                    ),

                    // CADASTRO DE EMAIL
                    TextFormField(
                      controller: controllerEmail,
                      decoration: InputDecoration(
                        labelText: "E-mail",
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 145, 0, 0)),
                        prefixIcon: Icon(Icons.mail_outline,
                            color: Color.fromARGB(255, 145, 0, 0)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: (BorderSide(
                                color: Color.fromARGB(255, 145, 0, 0)))),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: (BorderSide(
                                color: Color.fromARGB(255, 145, 0, 0)))),
                      ),
                    ),

                    // CADASTRO DE SENHA
                    TextFormField(
                      controller: controllerPassword,
                      decoration: InputDecoration(
                        labelText: "Senha",
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 145, 0, 0)),
                        prefixIcon: Icon(
                          Icons.vpn_key_sharp,
                          color: Color.fromARGB(255, 145, 0, 0),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscuretext = !_obscuretext;
                            });
                          },
                          child: Icon(_obscuretext
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: (BorderSide(
                                color: Color.fromARGB(255, 145, 0, 0)))),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: (BorderSide(
                                color: Color.fromARGB(255, 145, 0, 0)))),
                      ),
                      obscureText: _obscuretext,
                    ),

                    // CONFIRMAÇÃO DE SENHA
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Confirme a Senha",
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 145, 0, 0)),
                        prefixIcon: Icon(
                          Icons.vpn_key_sharp,
                          color: Color.fromARGB(255, 145, 0, 0),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscuretext = !_obscuretext;
                            });
                          },
                          child: Icon(_obscuretext
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: (BorderSide(
                                color: Color.fromARGB(255, 145, 0, 0)))),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: (BorderSide(
                                color: Color.fromARGB(255, 145, 0, 0)))),
                      ),
                      obscureText: _obscuretext,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),

              //BOTÃO CADASTRAR
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Cadastrar",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      CustomColors().getActivePrimaryButton()),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
