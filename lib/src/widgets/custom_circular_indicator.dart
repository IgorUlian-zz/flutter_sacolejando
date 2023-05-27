// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class CustomCircularIndicator extends StatelessWidget {
  final double width;
  final double height;
  final String textLabel;

  CustomCircularIndicator({
    this.width = 30,
    this.height = 30,
    required this.textLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            width: width,
            height: height,
            child: const CircularProgressIndicator(
                color: Colors.white,
                backgroundColor: Color.fromARGB(255, 180, 0, 0)),
          ),
          Text(
            textLabel,
            style: const TextStyle(
              color: Color.fromARGB(255, 180, 0, 0),
            ),
          )
        ],
      ),
    );
  }
}
