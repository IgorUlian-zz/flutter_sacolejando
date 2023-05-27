// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class User {
  String client_name;
  String client_email;

  User({
    required this.client_name,
    required this.client_email,
  });

  factory User.fromJson(jsonData) {
    return User(
      client_name: jsonData['client_name'],
      client_email: jsonData['client_email'],
    );
  }

  toJson() {
    return jsonEncode({
      'client_name': client_name,
      'email': client_email,
    });
  }
}
