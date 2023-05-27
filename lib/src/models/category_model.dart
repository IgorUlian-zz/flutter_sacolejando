// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class Category {
  String uuid;
  String category_name;
  String category_desc;

  Category({
    required this.uuid,
    required this.category_name,
    required this.category_desc,
  });

  factory Category.fromJson(jsonData) {
    return Category(
      uuid: jsonData['uuid'].toString(),
      category_name: jsonData['category_name'],
      category_desc: jsonData['category_desc'].toString(),
    );
  }

  toJson() {
    return jsonEncode({
      'uuid': uuid,
      'category_name': category_name,
      'category_desc': category_desc,
    });
  }
}
