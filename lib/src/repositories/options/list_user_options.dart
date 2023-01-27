import 'package:projeto_tcc_teste_sacolejando/src/models/user_options_model.dart';

class OptionsUserRepository {
  static List<UserOptions> listUserOptions = [
    UserOptions(
        name: 'Meus Dados',
        description: 'Aqui você pode visualizar e alterar seus dados.'),
    UserOptions(
        name: 'Meus Endereços',
        description: 'Aqui você pode visualizar e alterar seus endereços.'),
    UserOptions(
        name: 'Favoritos',
        description: 'Aqui você pode visualizar e alterar seus favoritos.'),
    UserOptions(
        name: 'Trabalhe Conosco',
        description:
            'Aqui você pode ver informações para trabalhar no Sacolejando.'),
    UserOptions(
        name: 'Ajuda',
        description: 'Aqui você pode pedir ajuda aos Universitários'),
  ];
  bool isLoading = false;
}
