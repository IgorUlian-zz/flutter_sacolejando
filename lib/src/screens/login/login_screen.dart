import 'package:flutter/material.dart';
import 'package:projeto_tcc_teste_sacolejando/src/screens/home/home_screen_tenant.dart';
import '../../constants/custom_colors.dart';
import 'package:projeto_tcc_teste_sacolejando/src/screens/signup/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool connected = false;
  bool isLoggedIn = false;
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return const Color.fromARGB(255, 180, 0, 0);
    }
    return const Color.fromARGB(255, 145, 0, 0);
  }

  @override
  Widget build(BuildContext context) {
    const Text(
      "Login",
      style: TextStyle(
        color: Colors.white,
      ),
    );
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 50,
              ),
              Image.asset(
                "assets/logo-sacolejando-atualizado1.png",
                height: 220,
              ),
              const Padding(
                padding: EdgeInsets.only(
                  bottom: 30,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: controllerEmail,
                      enabled: !isLoggedIn,
                      validator: (value) {
                        if (value!.length > 6) {
                          return "Esse e-mail parece muito pequeno";
                        } else if (!value.contains("@")) {
                          return "Acho que está faltando algo nesse e-mail";
                        }
                        return null;
                      },
                      autofocus: true,
                      decoration: const InputDecoration(
                        labelText: "E-mail",
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 145, 0, 0),
                        ),
                        prefixIcon: Icon(
                          Icons.mail_outline,
                          color: Color.fromARGB(255, 145, 0, 0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: (BorderSide(
                          color: Color.fromARGB(255, 145, 0, 0),
                        ))),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: (BorderSide(
                          color: Color.fromARGB(255, 145, 0, 0),
                        ))),
                      ),
                    ),
                    TextFormField(
                      controller: controllerPassword,
                      enabled: !isLoggedIn,
                      validator: (value) {
                        if (value!.length > 6) {
                          return "A senha precisa de pelo menos 6 caracteres.";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: "Senha",
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 145, 0, 0),
                        ),
                        prefixIcon: Icon(
                          Icons.vpn_key_sharp,
                          color: Color.fromARGB(255, 145, 0, 0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: (BorderSide(
                          color: Color.fromARGB(255, 145, 0, 0),
                        ))),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: (BorderSide(
                          color: Color.fromARGB(255, 145, 0, 0),
                        ))),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
              ),
              GestureDetector(
                child: const Text(
                  "Esqueceu a senha?",
                  style: TextStyle(
                    color: Color.fromARGB(255, 145, 0, 0),
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              Row(
                children: [
                  Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: connected,
                      onChanged: (bool? value) {
                        setState(() {
                          connected = value!;
                        });
                      }),
                  const Text(
                    "Manter conectado?",
                    style: TextStyle(
                      color: Color.fromARGB(255, 145, 0, 0),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreenTenant(),
                      ));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      CustomColors().getActivePrimaryButton()),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Divider(
                  color: Color.fromARGB(255, 145, 0, 0),
                ),
              ),
              const Text(
                "Ainda não tem uma conta?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Color.fromARGB(255, 145, 0, 0),
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),
                      ));
                },
                // ignore: sort_child_properties_last
                child: const Text(
                  "Cadastre-se",
                  style: TextStyle(
                    color: Color.fromARGB(255, 145, 0, 0),
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      CustomColors().getActiveSecundaryButton()),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showSuccess(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Sucesso!"),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void showError(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Algo deu Errado!"),
          content: Text(errorMessage),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void openHomeScreenUser() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeScreenTenant(),
      ),
    );
  }
}
