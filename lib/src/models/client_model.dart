// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class Client {
  String client_name;
  String client_email;
  String? contact;

  Client({
    required this.client_name,
    required this.client_email,
    required this.contact,
  });

  factory Client.fromJson(jsonData) {
    return Client(
      client_name: jsonData['client_name'],
      client_email: jsonData['client_email'],
      contact: jsonData['contact'],
    );
  }

  toJson() {
    return jsonEncode({
      'client_name': client_name,
      'client_email': client_email,
      'contact': contact,
    });
  }
}
