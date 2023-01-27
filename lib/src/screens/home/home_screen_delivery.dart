// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:projeto_tcc_teste_sacolejando/src/models/category_model.dart';

class HomeScreenDelivery extends StatefulWidget {
  const HomeScreenDelivery({super.key});

  @override
  State<HomeScreenDelivery> createState() => _HomeScreenDeliveryState();
}

class _HomeScreenDeliveryState extends State<HomeScreenDelivery> {
  List<Category> listCategory = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
    );
  }
}
