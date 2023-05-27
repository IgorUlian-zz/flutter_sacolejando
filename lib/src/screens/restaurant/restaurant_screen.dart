// ignore_for_file: avoid_unnecessary_containers, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:projeto_tcc_teste_sacolejando/src/models/restaurants_model.dart';
import 'package:projeto_tcc_teste_sacolejando/src/repositories/restaurants/card_restaurant.dart';
import 'package:projeto_tcc_teste_sacolejando/src/repositories/restaurants/restaurant_repository.dart';

import '../../widgets/bottom_navigator.dart';
import '../../widgets/custom_circular_indicator.dart';

class RestaurantScreen extends StatefulWidget {
  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  final List<Restaurant> _restaurants = [];
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
        title: const Text("Restaurantes"),
        centerTitle: true,
      ),
      body: isLoading
          ? CustomCircularIndicator(
              textLabel: 'Carregando ...',
            )
          : _buildRestaurants(context),
      bottomNavigationBar: BottomNavigator(0),
    );
  }

  Widget _buildRestaurants(context) {
    return Container(
      child: ListView.builder(
        itemCount: _restaurants.length,
        itemBuilder: (context, index) {
          final Restaurant restaurant = _restaurants[index];

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
      _restaurants.addAll(restaurants);
    });
    setState(() => isLoading = false);
  }
}
