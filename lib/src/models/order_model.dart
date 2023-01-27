import 'dart:convert';

import 'package:projeto_tcc_teste_sacolejando/src/models/evaluation_model.dart';
import 'package:projeto_tcc_teste_sacolejando/src/models/food_model.dart';

class Order {
  int id;
  int userId;
  int foodId;
  int stPaymentId;
  int stOrderId;
  String orderPrice;
  String orderComment;
  String orderDate;
  List<Food> foods;
  List<Evaluation> evaluations;

  Order({
    required this.id,
    required this.userId,
    required this.foodId,
    required this.stPaymentId,
    required this.stOrderId,
    required this.orderPrice,
    required this.orderComment,
    required this.orderDate,
    required this.foods,
    required this.evaluations,
  });

  factory Order.fromJson(jsonData) {
    return Order(
      id: jsonData['id'],
      userId: jsonData['user_id'],
      foodId: jsonData['food_id'],
      stPaymentId: jsonData['st_payment_id'],
      stOrderId: jsonData['st_order_id'],
      orderPrice: jsonData['order_price'],
      orderComment: jsonData['order_comment'],
      orderDate: jsonData['order_date'],
      foods: jsonData['foods'],
      evaluations: jsonData['evaluations'],
    );
  }
  toJson() {
    return jsonEncode({
      'id': id,
      'user_id': userId,
      'food_id': foodId,
      'st_payment_id': stPaymentId,
      'st_order_id': stOrderId,
      'order_price': orderComment,
      'order_comment': orderComment,
      'order_date': orderDate,
      'foods': foods,
      'evaluations': evaluations,
    });
  }
}
