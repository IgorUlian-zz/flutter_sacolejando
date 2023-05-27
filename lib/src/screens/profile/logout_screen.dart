// ignore_for_file: sort_child_properties_last, must_be_immutable

import 'package:flutter/material.dart';
import 'package:projeto_tcc_teste_sacolejando/src/constants/custom_colors.dart';
import 'package:projeto_tcc_teste_sacolejando/src/store/auth_store.dart';
import 'package:projeto_tcc_teste_sacolejando/src/widgets/bottom_navigator.dart';
import 'package:provider/provider.dart';

class LogoutScreen extends StatelessWidget {
  late AuthStore _authStore;

  LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    _authStore = Provider.of<AuthStore>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 180, 0, 0),
        title: const Text("Logout"),
        centerTitle: true,
      ),
      body: Center(child: _buildProfileScreen(context)),
      bottomNavigationBar: BottomNavigator(3),
    );
  }

  Widget _buildProfileScreen(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          " Obrigado por me acompanhar até aqui, é com um enorme prazer que me despeço dessa jornada. Espero ter alegrado a todos e que fiquem ligados nas novidas do Sacolejando. Até mais Sr(a). ${_authStore.client!.client_name}.",
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        Container(height: 10),
        Text(
          _authStore.client!.client_email,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        Container(height: 10),
        ElevatedButton(
          onPressed: () => _authStore.isLoading ? null : logout(context),
          child: Text(
            _authStore.isLoading ? 'saindo...' : 'Sair',
            style: const TextStyle(
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
    );
  }

  Future logout(context) async {
    await _authStore.logout();

    Navigator.popAndPushNamed(context, '/login');
  }
}
