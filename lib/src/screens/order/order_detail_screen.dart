// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, unused_field, prefer_final_fields, must_be_immutable, avoid_returning_null_for_void, prefer_is_empty, unnecessary_null_comparison, unused_local_variable, no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:projeto_tcc_teste_sacolejando/src/models/evaluation_model.dart';
import 'package:projeto_tcc_teste_sacolejando/src/models/food_model.dart';
import 'package:projeto_tcc_teste_sacolejando/src/models/order_model.dart';
import 'package:projeto_tcc_teste_sacolejando/src/repositories/food/card_food.dart';
import 'package:projeto_tcc_teste_sacolejando/src/widgets/bottom_navigator.dart';

class OrderDetailScreen extends StatefulWidget {
  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  late Order _order;

  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context)!.settings;
    _order = (settings.arguments as Order);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Pedido'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 180, 0, 0),
      ),
      body: SingleChildScrollView(
        child: _buildOrderDetails(context),
      ),
      bottomNavigationBar: BottomNavigator(2),
    );
  }

  Widget _buildOrderDetails(context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 5, right: 10, left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _makeTextOrder('Código do Pedido', _order.identify),
          _makeTextOrder('Status', _order.status),
          _makeTextOrder('Data', _order.date),
          _makeTextOrder('Endereço', _order.adress),
          _makeTextOrder('Pagamento', _order.payment.toString()),
          _makeTextOrder('Preço', _order.total.toString()),
          _order.comments != null
              ? _makeTextOrder('Comentário', _order.comments)
              : Container(),
          Container(
            height: 30,
          ),
          const Text(
            'Comidas:',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
          ),
          _buildFoodsOrder(),
          Container(
            height: 30,
          ),
          const Text(
            'Avaliações:',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
          ),
          _buildEvaluationsOrder(context),
        ],
      ),
    );
  }

  Widget _makeTextOrder(String textLabel, String textValue) {
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 5),
      child: Row(
        children: <Widget>[
          Text(
            '$textLabel: ',
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(
            textValue,
            style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodsOrder() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _order.foods.length,
      itemBuilder: (context, index) {
        final Food food = _order.foods[index];
        return FoodCard(
          food: food,
          notShowIconCart: true,
        );
      },
    );
  }

  Widget _buildEvaluationsOrder(context) {
    return _order.evaluations.length > 0
        ? Container(
            padding: const EdgeInsets.only(left: 10),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _order.evaluations.length,
              itemBuilder: (context, index) {
                final Evaluation evaluation = _order.evaluations[index];
                return _buildEvaluationItem(evaluation, context);
              },
            ),
          )
        : Container(
            height: 40,
            margin: const EdgeInsets.only(bottom: 30, top: 10),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/order_evaluation',
                  arguments: _order.identify,
                );
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.orange),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              child: const Text(
                "Avalie seu Pedido",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          );
  }
}

Widget _buildEvaluationItem(Evaluation evaluation, context) {
  double? _rating;
  return Card(
    child: Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.grey[50],
          border: Border.all(),
          borderRadius: const BorderRadius.all(Radius.circular(4))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RatingBar.builder(
            initialRating: evaluation.stars,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 12,
            itemPadding: const EdgeInsets.symmetric(horizontal: 8),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              _rating = null;
            },
          ),
          Row(
            children: <Widget>[
              Text(
                evaluation.client.client_name,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Text(
                evaluation.comment,
                style: const TextStyle(color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
