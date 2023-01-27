class Category {
  int id;
  String categoryName;
  String categoryDesc;

  Category({
    required this.id,
    required this.categoryName,
    required this.categoryDesc,
  });

  factory Category.fromJson(jsonData) {
    return Category(
      id: jsonData['id'],
      categoryName: jsonData['category_name'],
      categoryDesc: jsonData['category_desc'],
    );
  }

  toJson() {}
}
