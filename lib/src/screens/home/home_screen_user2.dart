// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:projeto_tcc_teste_sacolejando/src/models/restaurants_model.dart';
import 'package:projeto_tcc_teste_sacolejando/src/repositories/restaurants/card_restaurant.dart';
import 'package:projeto_tcc_teste_sacolejando/src/repositories/restaurants/restaurant_repository.dart';

class HomeScreenUser2 extends StatefulWidget {
  const HomeScreenUser2({super.key});

  @override
  State<HomeScreenUser2> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenUser2> {
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
    final restaurants = await RestaurantRepository().getRestaurants();

    setState(() {
      listRestaurant.addAll(restaurants);
    });
  }
}
