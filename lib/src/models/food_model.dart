import 'dart:convert';

class Food {
  int id;
  int categoryId;
  int restaurantId;
  String foodName;
  String foodPrice;
  String foodIngredients;

  Food(
      {required this.id,
      required this.categoryId,
      required this.restaurantId,
      required this.foodName,
      required this.foodPrice,
      required this.foodIngredients});

  factory Food.fromJson(jsonData) {
    return Food(
      id: jsonData['id'],
      categoryId: jsonData['category_id'],
      restaurantId: jsonData['restaurant_id'],
      foodName: jsonData['food_name'],
      foodPrice: jsonData['food_price'],
      foodIngredients: jsonData['food_ingredients'],
    );
  }
  toJson() {
    return jsonEncode({
      'id': id,
      'category_id': categoryId,
      'restaurantId': restaurantId,
      'foodName': foodName,
      'foodPrice': foodPrice,
      'foodIngredients': foodIngredients,
    });
  }
}
