// ignore_for_file: avoid_unnecessary_containers, avoid_returning_null_for_void, avoid_print, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:projeto_tcc_teste_sacolejando/src/store/order_store.dart';
import 'package:projeto_tcc_teste_sacolejando/src/widgets/bottom_navigator.dart';
import 'package:provider/provider.dart';

class EvaluationScreen extends StatelessWidget {
  int stars = 1;
  final TextEditingController _comment = TextEditingController();
  late OrderStore _orderStore;

  late String identifyOrder;

  @override
  Widget build(BuildContext context) {
    _orderStore = Provider.of<OrderStore>(context);

    RouteSettings settings = ModalRoute.of(context)!.settings;
    identifyOrder = (settings.arguments as String);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avaliar o Pedido'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 180, 0, 0),
      ),
      body: Observer(
        builder: (context) => _buildEvaluationScreen(context),
      ),
      bottomNavigationBar: BottomNavigator(2),
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
      child: Text(
        "Avaliar o Pedido: $identifyOrder",
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
  }

  Widget _buildFormEvaluation(context) {
    return Container(
      child: Column(
        children: <Widget>[
          RatingBar.builder(
            initialRating: stars.toDouble(),
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
              stars = value.toInt();
            },
          ),
          TextFormField(
            controller: _comment,
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
              makeEvaluationOrder(context);
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

  Future makeEvaluationOrder(context) async {
    await _orderStore.evaluationOrder(identifyOrder, stars,
        comment: _comment.text);

    Navigator.pushReplacementNamed(context, '/order_user');
  }
}
