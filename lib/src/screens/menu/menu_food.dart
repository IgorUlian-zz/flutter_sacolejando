import 'package:flutter/material.dart';

class MenuFood extends StatefulWidget {
  const MenuFood({super.key});

  @override
  State<MenuFood> createState() => _MenuFoodState();
}

class _MenuFoodState extends State<MenuFood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Compras'),
      ),
    );
  }

  /*Widget _buildMenuFood(context) {
    final tabela = MenuFoodRepository.tabela;
    return ListView.builder(
      itemCount: tabela.length,
      itemBuilder: (context, index) {
        final MenuFood menuFood = tabela[index];

        return MenuFoodCard(
          id: menuFood.id,
          na: category.categoryName,
          categoryDesc: category.categoryDesc,
        );
      },
    );*/
}
