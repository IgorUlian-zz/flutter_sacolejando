import 'dart:convert';

class Evaluation {
  int id;
  int userId;
  double stars;
  String comment;

  Evaluation({
    required this.id,
    required this.userId,
    required this.stars,
    required this.comment,
  });

  factory Evaluation.fromJson(jsonData) {
    return Evaluation(
        id: jsonData['id'],
        userId: jsonData['user_id'],
        stars: double.parse(jsonData['stars']),
        comment: jsonData['comment']);
  }

  toJson() {
    return jsonEncode({
      'id': id,
      'user_id': userId,
      'stars': stars,
      'comment': comment,
    });
  }
}
