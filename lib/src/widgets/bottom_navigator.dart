// ignore_for_file: must_be_immutable, prefer_final_fields, unnecessary_new

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projeto_tcc_teste_sacolejando/src/store/food_store.dart';
import 'package:provider/provider.dart';

class BottomNavigator extends StatelessWidget {
  int _activeItem = 0;

  BottomNavigator(this._activeItem, {super.key});

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
        animationDuration: const Duration(milliseconds: 150),
        backgroundColor: Colors.white,
        color: const Color.fromARGB(255, 180, 0, 0),
        height: 45,
        index: _activeItem,
        items: <Widget>[
          const Icon(
            Icons.home,
            color: Colors.white,
          ),
          _iconCart(context),
          const Icon(
            Icons.list,
            color: Colors.white,
          ),
          const Icon(
            Icons.supervised_user_circle,
            color: Colors.white,
          )
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/restaurant');
              break;
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
              Navigator.pushReplacementNamed(context, '/restaurant');
          }
        });
  }

  Widget _iconCart(context) {
    final storeFoods = Provider.of<FoodStore>(context);

    return Stack(
      children: [
        const Icon(
          Icons.shopping_cart,
          color: Colors.white,
        ),
        Positioned(
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(6)),
            constraints: const BoxConstraints(minHeight: 12, minWidth: 12),
            child: Observer(
              builder: (_) {
                return Text(storeFoods.cartItems.length.toString(),
                    style: const TextStyle(color: Colors.white),
                    textAlign: TextAlign.center);
              },
            ),
          ),
        ),
      ],
    );
  }
}
