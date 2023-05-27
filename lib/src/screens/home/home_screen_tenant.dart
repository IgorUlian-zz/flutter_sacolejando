// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:projeto_tcc_teste_sacolejando/src/models/restaurants_model.dart';
import 'package:projeto_tcc_teste_sacolejando/src/repositories/restaurants/card_restaurant.dart';
import 'package:projeto_tcc_teste_sacolejando/src/repositories/restaurants/restaurant_repository.dart';

class HomeScreenTenant extends StatefulWidget {
  const HomeScreenTenant({super.key});

  @override
  State<HomeScreenTenant> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenTenant> {
  List<Restaurant> listRestaurant = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    getRestaurants();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 180, 0, 0),
          // title: Text('${_restaurant.restaurantName}'),
          title: const Text("Restaurantes"),
          centerTitle: true,
        ),
        body: Container(
          child: _buildRestaurants(
            context,
          ),
        ));
  }

  Widget _buildRestaurants(context) {
    return Container(
      child: ListView.builder(
        itemCount: listRestaurant.length,
        itemBuilder: (context, index) {
          final Restaurant restaurant = listRestaurant[index];

          return RestauranteCard(
            restaurant: restaurant,
          );
        },
      ),
    );
  }

  void getRestaurants() async {
    setState(() => isLoading = true);

    final restaurants = await RestaurantRepository().getRestaurants();

    setState(() {
      listRestaurant.addAll(restaurants);
    });
    setState(() => isLoading = false);
  }
}
