// ignore_for_file: non_constant_identifier_names, unused_local_variable, no_leading_underscores_for_local_identifiers

import 'dart:convert';

import 'package:projeto_tcc_teste_sacolejando/src/models/evaluation_model.dart';
import 'package:projeto_tcc_teste_sacolejando/src/models/food_model.dart';

class Order {
  String identify;
  String order_comment;
  String status;
  double total;
  String date;
  List<Food> foods;
  List<Evaluation> evaluations;

  Order({
    required this.identify,
    required this.order_comment,
    required this.status,
    required this.total,
    required this.date,
    required this.foods,
    required this.evaluations,
  });

  factory Order.fromJson(jsonData) {
    List<Food> _foodsApi = ((jsonData['foods'] ?? []) as List)
        .map((food) => Food.fromJson(food))
        .toList();

    List<Evaluation> _evaluationsApi = ((jsonData['evaluations'] ?? []) as List)
        .map((evaluation) => Evaluation.fromJson(evaluation))
        .toList();

    return Order(
      identify: jsonData['identify'],
      status: jsonData['status'],
      order_comment: jsonData['order_comment'].toString(),
      total: double.parse(jsonData['total'].toString()),
      date: jsonData['date'],
      foods: _foodsApi,
      evaluations: _evaluationsApi,
    );
  }
  toJson() {
    return jsonEncode({
      'identify': identify,
      'status': status,
      'order_comment': order_comment,
      'total': total,
      'date': date,
      'foods': foods,
      'evaluations': evaluations,
    });
  }
}
