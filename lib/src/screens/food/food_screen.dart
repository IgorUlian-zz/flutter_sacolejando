// ignore_for_file: sized_box_for_whitespace, unnecessary_string_interpolations, unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projeto_tcc_teste_sacolejando/src/models/category_model.dart';
import 'package:projeto_tcc_teste_sacolejando/src/models/restaurants_model.dart';
import 'package:projeto_tcc_teste_sacolejando/src/repositories/food/card_food.dart';
import 'package:projeto_tcc_teste_sacolejando/src/store/food_store.dart';
import 'package:projeto_tcc_teste_sacolejando/src/widgets/categories_food_navigator.dart';

import '../../models/food_model.dart';
import '../../widgets/bottom_navigator_user.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  List<Category> listCategory = [
    Category(id: 1, categoryName: 'Lanches', categoryDesc: 'categoryDesc'),
    Category(id: 2, categoryName: 'Pizzas', categoryDesc: 'categoryDesc'),
    Category(id: 3, categoryName: 'Pastéis', categoryDesc: 'categoryDesc'),
    Category(id: 4, categoryName: 'Salgados', categoryDesc: 'categoryDesc'),
    Category(
        id: 1, categoryName: 'Comida Japonesa', categoryDesc: 'categoryDesc'),
    Category(id: 5, categoryName: 'Comida Fit', categoryDesc: 'categoryDesc'),
    Category(id: 6, categoryName: 'Caldos', categoryDesc: 'categoryDesc'),
    Category(id: 7, categoryName: 'Churrasco', categoryDesc: 'categoryDesc'),
    Category(id: 8, categoryName: 'Esfihas', categoryDesc: 'categoryDesc'),
    Category(id: 9, categoryName: 'Marmitas', categoryDesc: 'categoryDesc'),
    Category(id: 10, categoryName: 'Açaí', categoryDesc: 'categoryDesc'),
    Category(id: 11, categoryName: 'Sorvetes', categoryDesc: 'categoryDesc'),
    Category(id: 12, categoryName: 'Doces', categoryDesc: 'categoryDesc'),
  ];

  FoodStore storeFoods = new FoodStore();
  late Restaurant _restaurant;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    RouteSettings settings = ModalRoute.of(context)!.settings;
    _restaurant = (settings.arguments as Restaurant?)!;

    storeFoods.getFoods(_restaurant.id);
  }

  @override
  void dispose() {
    super.dispose();
    //getFoods();
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 180, 0, 0),
        // title: Text('${_restaurant.restaurantName}'),
        title: Text(_restaurant.restaurantName),
        centerTitle: true,
      ),
      body: _builCategoriesFood(),
      bottomNavigationBar: BottomNavigatorUser(0),
    );
  }

  Widget _builCategoriesFood() {
    //return const Text('foods');
    return Column(
      children: <Widget>[
        CategoriesFood(listCategory),
        Observer(builder: (context) {
          return storeFoods.isLoading
              ? const CircularProgressIndicator()
              : storeFoods.listFoods.isEmpty
                  ? const Center(
                      child: Text(
                        "Não há Alimentos aqui.",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  : _buildFoods();
        }),
      ],
    );
  }

  Widget _buildFoods() {
    return Container(
      height: (MediaQuery.of(context).size.height - 230),
      width: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: storeFoods.listFoods.length,
        itemBuilder: (context, index) {
          final Food food = storeFoods.listFoods[index];

          return FoodCard(
            food: food,
            notShowIconCart: false,
          );
        },
      ),
    );
  }

  /*void getFoods() async {
    final foods = await FoodRepository().getFoods();

    setState(() {
      storeFoods.addAll(foods);
    });
  }*/
}
