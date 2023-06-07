// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';

class Food {
  String identify;
  String food_name;
  String price;
  String food_desc;
  String ingredients;
  String image;

  Food({
    required this.identify,
    required this.food_name,
    required this.price,
    required this.ingredients,
    required this.food_desc,
    required this.image,
  });

  factory Food.fromJson(jsonData) {
    return Food(
      identify: jsonData['identify'],
      food_name: jsonData['food_name'],
      ingredients: jsonData['ingredients'],
      price: jsonData['price'].toString(),
      food_desc: jsonData['food_desc'],
      image: jsonData['image'],
    );
  }
  toJson() {
    return jsonEncode({
      'identify': identify,
      'food_name': food_name,
      'price': price,
      'ingredients': ingredients,
      'food_desc': food_desc,
      'image': image,
    });
  }
}
