// ignore_for_file: must_be_immutable, prefer_final_fields, file_names

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomNavigatorDelivery extends StatelessWidget {
  int _activeItem = 0;

  BottomNavigatorDelivery(this._activeItem, {super.key});

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      animationDuration: const Duration(milliseconds: 200),
      backgroundColor: Colors.white,
      color: const Color.fromARGB(255, 180, 0, 0),
      height: 45,
      index: _activeItem,
      items: const <Widget>[
        Icon(
          Icons.home,
          color: Colors.white,
        ),
        Icon(
          Icons.shopping_cart,
          color: Colors.white,
        ),
        Icon(
          Icons.list_alt,
          color: Colors.white,
        ),
        Icon(
          Icons.person,
          color: Colors.white,
        ),
      ],
    );
  }
}
