import 'dart:convert';

class Restaurant {
  /*'user_id',
        'profile_id',
        'restaurants_cnpj',
        'restaurant_name',
        'restaurant_contact',*/
  String id;
  int userId;
  int profileId;
  String restaurantsCnpj;
  String restaurantName;
  String restaurantContact;

  Restaurant(
      {required this.id,
      required this.userId,
      required this.profileId,
      required this.restaurantsCnpj,
      required this.restaurantName,
      required this.restaurantContact});

  factory Restaurant.fromJson(jsonData) {
    return Restaurant(
      id: jsonData['id'].toString(),
      userId: jsonData['user_id'],
      profileId: jsonData['profile_id'],
      restaurantsCnpj: jsonData['restaurants_cnpj'],
      restaurantName: jsonData['restaurant_name'],
      restaurantContact: jsonData['restaurant_contact'],
    );
  }

  toJson() {
    return jsonEncode({
      'id': id,
      'user_id': userId,
      'profile_id': profileId,
      'restaurants_cnpj': restaurantsCnpj,
      'restaurant_name': restaurantName,
      'restaurant_contact': restaurantContact,
    });
  }
}
