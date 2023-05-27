import 'dart:convert';

import 'package:projeto_tcc_teste_sacolejando/src/models/client_model.dart';

class Evaluation {
  Client client;
  double stars;
  String comment;

  Evaluation({
    required this.client,
    required this.stars,
    required this.comment,
  });

  factory Evaluation.fromJson(jsonData) {
    return Evaluation(
        client: Client.fromJson(jsonData['client'].toString()),
        stars: double.parse(jsonData['stars'].toString()),
        comment: jsonData['comment']);
  }

  toJson() {
    return jsonEncode({
      'client': client,
      'stars': stars,
      'comment': comment,
    });
  }
}
