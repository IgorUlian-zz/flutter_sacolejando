import 'package:flutter/material.dart';
import 'package:projeto_tcc_teste_sacolejando/src/models/restaurants_model.dart';

class RestauranteCard extends StatelessWidget {
  final Restaurant restaurant;

  const RestauranteCard({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/food', arguments: restaurant);
        },
        child: Container(
          padding: const EdgeInsets.only(top: 2, right: 1, left: 1, bottom: 0),
          child: Card(
            elevation: 2.5,
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade200),
                borderRadius: const BorderRadius.all(Radius.circular(3)),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      child: ClipRRect(
                        child: Image.asset('assets/logo_padrao_rest.png'),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        restaurant.tenant_name,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 99, 99, 99),
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
