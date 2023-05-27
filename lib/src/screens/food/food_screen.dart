// ignore_for_file: sized_box_for_whitespace, unnecessary_string_interpolations, unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:projeto_tcc_teste_sacolejando/src/models/restaurants_model.dart';
import 'package:projeto_tcc_teste_sacolejando/src/repositories/food/card_food.dart';
import 'package:projeto_tcc_teste_sacolejando/src/store/category_store.dart';
import 'package:projeto_tcc_teste_sacolejando/src/store/food_store.dart';
import 'package:projeto_tcc_teste_sacolejando/src/store/restaurant_store.dart';
import 'package:projeto_tcc_teste_sacolejando/src/widgets/bottom_navigator.dart';
import 'package:provider/provider.dart';

import '../../models/food_model.dart';
import '../../widgets/categories_food_navigator.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  late Restaurant _restaurant;

  late FoodStore storeFoods;
  late CategoryStore storeCategories;
  late RestaurantStore storeRestaurants;
  late ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    storeFoods = Provider.of<FoodStore>(context);
    storeCategories = Provider.of<CategoryStore>(context);
    storeRestaurants = Provider.of<RestaurantStore>(context);

    RouteSettings settings = ModalRoute.of(context)!.settings;
    _restaurant = (settings.arguments as Restaurant?)!;

    disposer = reaction((_) => storeCategories.filtersCategory,
        (filtersChanged) async {
      if (storeCategories.isLoading && storeFoods.isLoading) {
        await storeFoods.getFoods(_restaurant.uuid,
            categoriesFilter: storeCategories.filtersCategory);
      }
    });

    storeRestaurants.setRestaurant(_restaurant);
    storeCategories.getCategories(_restaurant.uuid);
    storeFoods.getFoods(_restaurant.uuid);
  }

  @override
  void dispose() {
    disposer();
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
        title: Text(_restaurant.tenant_name),
        centerTitle: true,
      ),
      body: _buildCategoriesFood(),
      bottomNavigationBar: BottomNavigator(0),
    );
  }

  Widget _buildCategoriesFood() {
    //return const Text('foods');
    return Column(
      children: <Widget>[
        Observer(
          builder: (context) {
            if (storeCategories.isLoading) {
              return const CircularProgressIndicator();
            } else {
              if (storeCategories.categories.isEmpty) {
                return const Center(
                  child: Text(
                    "Não há categorias aqui.",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                );
              } else {
                return CategoriesFood(storeCategories.categories);
              }
            }
          },
        ),
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
}
