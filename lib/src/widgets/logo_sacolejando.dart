import 'package:flutter/material.dart';

class LogoSacolejando extends StatelessWidget {
  const LogoSacolejando({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 200,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/logo-sacolejando-atualizado1.png'),
              fit: BoxFit.fill)),
    );
  }
}
