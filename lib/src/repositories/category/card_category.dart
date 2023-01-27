import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final int id;
  final String categoryName;
  final String categoryDesc;

  const CategoryCard({
    super.key,
    required this.id,
    required this.categoryName,
    required this.categoryDesc,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/food');
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
                      borderRadius: BorderRadius.circular(40.0),
                      child: Image.asset('assets/acai_red.png'),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      categoryName,
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
      ),
    );
  }
}
