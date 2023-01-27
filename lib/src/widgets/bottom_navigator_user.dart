// ignore_for_file: must_be_immutable, prefer_final_fields, file_names, avoid_print

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomNavigatorUser extends StatelessWidget {
  int _activeItem = 0;

  BottomNavigatorUser(this._activeItem, {super.key});

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
      onTap: (index) {
        switch (index) {
          case 1:
            Navigator.pushReplacementNamed(context, '/cart');
            break;
          case 2:
            Navigator.pushReplacementNamed(context, '/order_user');
            break;
          case 3:
            Navigator.pushReplacementNamed(context, '/user_profile');
            break;
          default:
            Navigator.pushReplacementNamed(context, '/home');
        }
      },
    );
  }
}
