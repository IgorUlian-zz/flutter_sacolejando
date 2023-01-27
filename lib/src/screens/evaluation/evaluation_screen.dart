// ignore_for_file: avoid_unnecessary_containers, avoid_returning_null_for_void, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:projeto_tcc_teste_sacolejando/src/widgets/bottom_navigator_user.dart';

class EvaluationScreen extends StatelessWidget {
  const EvaluationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avaliar o Pedido'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 180, 0, 0),
      ),
      body: _buildEvaluationScreen(context),
      bottomNavigationBar: BottomNavigatorUser(2),
    );
  }

  Widget _buildEvaluationScreen(context) {
    return Container(
      child: Column(
        children: <Widget>[
          _buildHeader(context),
          _buildFormEvaluation(context),
        ],
      ),
    );
  }

  Widget _buildHeader(context) {
    return Container(
      child: const Text(
        'Avaliar o Pedido',
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
  }

  Widget _buildFormEvaluation(context) {
    return Container(
      child: Column(
        children: <Widget>[
          RatingBar.builder(
            initialRating: 0,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 30,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (value) {
              print(value);
            },
          ),
          TextFormField(
            autocorrect: true,
            style: const TextStyle(
              color: Color.fromARGB(255, 180, 0, 0),
            ),
            cursorColor: const Color.fromARGB(255, 180, 0, 0),
            onSaved: (value) {
              print(value);
            },
            decoration: InputDecoration(
              labelText: 'Comentário (ex: Muito Bom!)',
              labelStyle: const TextStyle(
                color: Color.fromARGB(255, 180, 0, 0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 180, 0, 0),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 180, 0, 0),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/order_evaluation');
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
            child: const Text(
              "Avalie seu Pedido",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
