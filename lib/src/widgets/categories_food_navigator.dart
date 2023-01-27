// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:projeto_tcc_teste_sacolejando/src/models/category_model.dart';

class CategoriesFood extends StatelessWidget {
  List<Category> listCategory;

  CategoriesFood(this.listCategory);

  @override
  Widget build(BuildContext context) {
    return _buildCategories();
  }

  Widget _buildCategories() {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listCategory.length,
        itemBuilder: (context, index) {
          final Category category = listCategory[index];
          return _buildCategory(category);
        },
      ),
    );
  }

  Widget _buildCategory(Category category) {
    return Container(
      padding: const EdgeInsets.only(top: 2, bottom: 2, left: 20, right: 20),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
            color: category.categoryName == 'Lanches'
                ? Colors.black
                : Colors.grey),
      ),
      child: Center(
        child: Text(
          category.categoryName,
          style: TextStyle(
              color: category.categoryName == 'Lanches'
                  ? Colors.black
                  : Colors.grey,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
