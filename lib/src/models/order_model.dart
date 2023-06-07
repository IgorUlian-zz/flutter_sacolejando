// ignore_for_file: non_constant_identifier_names, unused_local_variable, no_leading_underscores_for_local_identifiers

import 'dart:convert';

import 'package:projeto_tcc_teste_sacolejando/src/models/evaluation_model.dart';
import 'package:projeto_tcc_teste_sacolejando/src/models/food_model.dart';

class Order {
  String identify;
  String comments;
  String status;
  double total;
  String date;
  String adress;
  String payment;
  List<Food> foods;
  List<Evaluation> evaluations;

  Order({
    required this.identify,
    required this.comments,
    required this.adress,
    required this.status,
    required this.total,
    required this.date,
    required this.payment,
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
      adress: jsonData['adress'],
      comments: jsonData['comments'],
      payment: jsonData['payment'],
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
      'adress': adress,
      'payment': payment,
      'comments': comments,
      'total': total,
      'date': date,
      'foods': foods,
      'evaluations': evaluations,
    });
  }
}
