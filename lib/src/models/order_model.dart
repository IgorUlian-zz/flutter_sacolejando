// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:projeto_tcc_teste_sacolejando/src/models/evaluation_model.dart';
import 'package:projeto_tcc_teste_sacolejando/src/models/food_model.dart';

class Order {
  String identify;
  String order_status;
  String order_comment;
  double total;
  String created_at;
  List<Food> foods;
  List<Evaluation> evaluations;

  Order({
    required this.identify,
    required this.order_status,
    required this.order_comment,
    required this.total,
    required this.created_at,
    required this.foods,
    required this.evaluations,
  });

  factory Order.fromJson(jsonData) {
    return Order(
      identify: jsonData['identify'],
      order_status: jsonData['order_status'],
      order_comment: jsonData['order_comment'],
      total: jsonData['total'],
      created_at: jsonData['created_at'],
      foods: jsonData['foods'],
      evaluations: jsonData['evaluations'],
    );
  }
  toJson() {
    return jsonEncode({
      'identify': identify,
      'order_status': order_status,
      'order_comment': order_comment,
      'total': total,
      'created_at': created_at,
      'foods': foods,
      'evaluations': evaluations,
    });
  }
}
