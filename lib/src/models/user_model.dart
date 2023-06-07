// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class User {
  String client_name;
  String client_email;
  String contact;

  User({
    required this.client_name,
    required this.client_email,
    required this.contact,
  });

  factory User.fromJson(jsonData) {
    return User(
      client_name: jsonData['client_name'],
      client_email: jsonData['client_email'],
      contact: jsonData['contact'],
    );
  }

  toJson() {
    return jsonEncode({
      'client_name': client_name,
      'email': client_email,
      'contact': contact,
    });
  }
}
