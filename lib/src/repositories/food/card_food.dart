// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:projeto_tcc_teste_sacolejando/src/models/food_model.dart';
import 'package:projeto_tcc_teste_sacolejando/src/store/food_store.dart';
import 'package:provider/provider.dart';

class FoodCard extends StatelessWidget {
  final Food food;
  final bool notShowIconCart;

  const FoodCard({super.key, this.notShowIconCart = false, required this.food});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 2, right: 1, left: 1, bottom: 0),
      child: Card(
        elevation: 2.5,
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade200),
            borderRadius: const BorderRadius.all(Radius.circular(3)),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Container(
              padding: EdgeInsets.only(right: 8, left: 8, top: 2, bottom: 2),
              child: Row(
                children: <Widget>[
                  _buildImageFood(),
                  _buildInfoFood(),
                  _buildButtomCart(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageFood() {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40.0),
        child: Image.asset('assets/acai_red.png'),
      ),
    );
  }

  Widget _buildInfoFood() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 5,
          ),
          Text(
            food.food_name,
            style: const TextStyle(
                color: Colors.black54,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          Container(
            height: 5,
          ),
          Text(
            food.food_desc,
            style: const TextStyle(
                color: Colors.black45,
                fontSize: 12,
                fontWeight: FontWeight.normal),
          ),
          Container(
            height: 5,
          ),
          Text(
            "R\$ ${food.price}",
            style: const TextStyle(
                color: Colors.black38,
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
          Container(
            height: 5,
          ),
        ],
      ),
    );
  }

  Widget _buildButtomCart(context) {
    final storeFoods = Provider.of<FoodStore>(context);
    return notShowIconCart
        ? Container()
        : Container(
            child: IconTheme(
              data: const IconThemeData(
                color: Color.fromARGB(255, 180, 0, 0),
              ),
              child: storeFoods.inFoodCart(food)
                  ? GestureDetector(
                      onTap: () => storeFoods.removeFoodCart(food),
                      child: Icon(
                        Icons.remove_shopping_cart,
                        color: Colors.orange,
                      ),
                    )
                  : GestureDetector(
                      onTap: () => storeFoods.addFoodCart(food),
                      child: Icon(Icons.shopping_cart),
                    ),
            ),
          );
  }
}
