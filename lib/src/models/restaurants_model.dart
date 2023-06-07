// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class Restaurant {
  String uuid;
  String tenant_cnpj;
  String tenant_name;
  String contact;
  //String tenant_image;

  Restaurant({
    required this.uuid,
    required this.tenant_cnpj,
    required this.tenant_name,
    required this.contact,
  });

  factory Restaurant.fromJson(jsonData) {
    return Restaurant(
      uuid: jsonData['uuid'],
      tenant_cnpj: jsonData['tenant_cnpj'],
      tenant_name: jsonData['tenant_name'],
      contact: jsonData['contact'],
    );
  }

  toJson() {
    return jsonEncode({
      'uuid': uuid,
      'tenant_cnpj': tenant_cnpj,
      'tenant_name': tenant_name,
      'contact': tenant_name,
    });
  }
}
