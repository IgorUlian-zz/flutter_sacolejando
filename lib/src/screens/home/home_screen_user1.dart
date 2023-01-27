// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:projeto_tcc_teste_sacolejando/src/data/network/dio_cliente.dart';
import 'package:projeto_tcc_teste_sacolejando/src/models/category_model.dart';
import 'package:projeto_tcc_teste_sacolejando/src/repositories/category/card_category.dart';

class HomeScreenUser1 extends StatefulWidget {
  const HomeScreenUser1({super.key});

  @override
  State<HomeScreenUser1> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenUser1> {
  List<Category> listCategory = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: _buildCategories(
        context,
      ),
    ));
  }

  Widget _buildCategories(context) {
    return Container(
      child: ListView.builder(
        itemCount: listCategory.length,
        itemBuilder: (context, index) {
          final Category category = listCategory[index];

          return CategoryCard(
            id: category.id,
            categoryName: category.categoryName,
            categoryDesc: category.categoryDesc,
          );
        },
      ),
    );
  }

  Future<void> getCategories() async {
    final response = await DioClient().get('categories/all');
    final categories = (response.data['data'] as List).map((category) {
      return Category.fromJson(category);
    }).toList();

    setState(() {
      listCategory.addAll(categories);
    });
  }
}
