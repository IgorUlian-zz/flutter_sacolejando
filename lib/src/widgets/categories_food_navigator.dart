// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:projeto_tcc_teste_sacolejando/src/models/category_model.dart';
import 'package:projeto_tcc_teste_sacolejando/src/store/category_store.dart';
import 'package:provider/provider.dart';

class CategoriesFood extends StatelessWidget {
  final List<Category> _listCategory;
  late CategoryStore storeCategory;

  CategoriesFood(this._listCategory);

  // ignore: empty_constructor_bodies
  @override
  Widget build(BuildContext context) {
    storeCategory = Provider.of<CategoryStore>(context);
    return _buildCategories();
  }

  Widget _buildCategories() {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _listCategory.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            final Category category =
                Category.fromJson({'uuid': 'all', 'category_name': 'Todas'});
            return _buildCategory(category);
          }
          final Category category = _listCategory[index - 1];
          return _buildCategory(category);
        },
      ),
    );
  }

  Widget _buildCategory(Category category) {
    final String uuidCategory = category.uuid;
    bool inFilter = storeCategory.inFilter(uuidCategory);
    return GestureDetector(
      onTap: () => inFilter
          ? storeCategory.removeFilter(category.uuid)
          : storeCategory.addFilter(category.uuid),
      child: Container(
        padding: const EdgeInsets.only(top: 2, bottom: 2, left: 20, right: 20),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: inFilter ? Colors.black : Colors.grey),
        ),
        child: Center(
          child: Text(
            category.category_name,
            style: TextStyle(
                color: inFilter ? Colors.black : Colors.grey,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
