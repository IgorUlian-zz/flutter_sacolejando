// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class Food {
  String identify;
  String food_name;
  String price;
  String food_desc;
  //String food_image;

  Food({
    required this.identify,
    required this.food_name,
    required this.price,
    required this.food_desc,
  });

  factory Food.fromJson(jsonData) {
    return Food(
      identify: jsonData['identify'],
      food_name: jsonData['food_name'],
      price: jsonData['price'].toString(),
      food_desc: jsonData['food_desc'],
    );
  }
  toJson() {
    return jsonEncode({
      'identify': identify,
      'food_name': food_name,
      'price': price,
      'food_desc': food_desc,
    });
  }
}
