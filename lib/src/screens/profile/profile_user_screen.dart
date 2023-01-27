// ignore_for_file: avoid_print, use_key_in_widget_constructors, must_be_immutable, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:projeto_tcc_teste_sacolejando/src/models/user_options_model.dart';
import 'package:projeto_tcc_teste_sacolejando/src/widgets/bottom_navigator_user.dart';

class ProfileUserScreen extends StatelessWidget {
  List<UserOptions> listUserOptions = [
    UserOptions(
        name: 'Meus Dados',
        description: 'Aqui você pode visualizar e alterar seus dados.'),
    UserOptions(
        name: 'Meus Endereços',
        description: 'Aqui você pode visualizar e alterar seus endereços.'),
    UserOptions(
        name: 'Meus Favoritos',
        description: 'Aqui você pode visualizar e alterar seus favoritos.'),
    UserOptions(
        name: 'Trabalhe Conosco',
        description:
            'Aqui você pode ver informações para trabalhar no Sacolejando.'),
    UserOptions(
        name: 'Ajuda',
        description: 'Aqui você pode pedir ajuda aos Universitários'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Perfil'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 180, 0, 0),
      ),
      body: _buildListUserProfile(context),
      bottomNavigationBar: BottomNavigatorUser(3),
    );
  }

  Widget _buildListUserProfile(context) {
    return ListView.builder(
      itemCount: listUserOptions.length,
      itemBuilder: (context, index) {
        UserOptions userOptions = listUserOptions[index];
        //return _buildButtonUserProfile(context);
        return Card(
          child: ListTile(
            title: Text(
              userOptions.name,
              style: const TextStyle(
                color: Color.fromARGB(255, 180, 0, 0),
              ),
            ),
            subtitle: Text(userOptions.description),
            trailing: const Icon(
              Icons.navigate_next,
              color: Color.fromARGB(255, 180, 0, 0),
            ),
            onTap: () {
              if (userOptions.name == 'Meus Dados') {
                Navigator.pushNamed(context, '/login');
              } else if (userOptions.name == 'Meus Endereços') {
                Navigator.pushNamed(context, '/category');
              } else if (userOptions.name == 'Meus Favoritos') {
                Navigator.pushNamed(context, '/login');
              } else if (userOptions.name == 'Trabalhe Conosco') {
                Navigator.pushNamed(context, '/category');
              } else {
                Navigator.pushNamed(context, '/home');
              }
            },
          ),
        );
      },
    );
  }
}
