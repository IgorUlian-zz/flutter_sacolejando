// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, avoid_print
import 'package:flutter/material.dart';
import 'package:projeto_tcc_teste_sacolejando/src/models/evaluation_model.dart';
import 'package:projeto_tcc_teste_sacolejando/src/models/food_model.dart';
import 'package:projeto_tcc_teste_sacolejando/src/widgets/bottom_navigator.dart';

import '../../models/order_model.dart';

class OrderScreen extends StatelessWidget {
  List<Order> listOrders = [
    Order(
      identify: 'awers3',
      order_status: 'aguardando',
      total: 599.90,
      order_comment: 'Gostosão',
      created_at: '02/11/2022',
      foods: [
        Food(
            identify: "1",
            food_name: 'X salada',
            price: '14,99',
            food_desc: 'Pão, queijo, presunto, salada e hamburguer')
      ],
      evaluations: [
        Evaluation(id: 1, userId: 1, stars: 3, comment: 'Gostoso esse Lanche'),
      ],
    ),
    Order(
      identify: 'awers3',
      order_status: 'aguardando',
      total: 599.90,
      order_comment: 'Gostosão',
      created_at: '02/11/2022',
      foods: [
        Food(
            identify: "1",
            food_name: 'X salada',
            price: '14,99',
            food_desc: 'Pão, queijo, presunto, salada e hamburguer')
      ],
      evaluations: [
        Evaluation(id: 1, userId: 1, stars: 3, comment: 'Gostoso esse Lanche'),
      ],
    ),
    Order(
      identify: 'awers3',
      order_status: 'aguardando',
      total: 599.90,
      order_comment: 'Gostosão',
      created_at: '02/11/2022',
      foods: [
        Food(
            identify: "1",
            food_name: 'X salada',
            price: '14,99',
            food_desc: 'Pão, queijo, presunto, salada e hamburguer')
      ],
      evaluations: [
        Evaluation(id: 1, userId: 1, stars: 3, comment: 'Gostoso esse Lanche'),
      ],
    ),
    Order(
      identify: 'awers3',
      order_status: 'aguardando',
      total: 599.90,
      order_comment: 'Gostosão',
      created_at: '02/11/2022',
      foods: [
        Food(
            identify: "1",
            food_name: 'X salada',
            price: '14,99',
            food_desc: 'Pão, queijo, presunto, salada e hamburguer')
      ],
      evaluations: [
        Evaluation(id: 1, userId: 1, stars: 3, comment: 'Gostoso esse Lanche'),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Pedidos'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 180, 0, 0),
      ),
      body: _buildOrderScreen(context),
      bottomNavigationBar: BottomNavigator(2),
    );
  }

  Widget _buildOrderScreen(context) {
    return Column(
      children: <Widget>[
        _buildOrderHeader(),
        _buildOrdersList(),
      ],
    );
  }

  Widget _buildOrderHeader() {
    return Container(
      margin: const EdgeInsets.all(16),
      alignment: Alignment.topLeft,
      child: const Text(
        'Meus Pedidos',
        style: TextStyle(fontSize: 16, color: Colors.black),
      ),
    );
  }

  Widget _buildOrdersList() {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: listOrders.length,
        itemBuilder: (context, index) {
          final Order order = listOrders[index];
          return _buildItemOrder(order, context);
        },
      ),
    );
  }

  Widget _buildItemOrder(Order order, context) {
    return Card(
      child: ListTile(
        title: Text(
          "Pedido #${order.identify}",
          style: const TextStyle(
            color: Color.fromARGB(255, 180, 0, 0),
          ),
        ),
        subtitle: Text(
          "Data #${order.created_at}",
          style: const TextStyle(color: Colors.black),
        ),
        trailing: const IconTheme(
          data: IconThemeData(
            color: Color.fromARGB(255, 180, 0, 0),
          ),
          child: Icon(Icons.navigate_next),
        ),
        onTap: () {
          print(order.identify);
          Navigator.pushNamed(context, '/order_details',
              arguments: order.identify);
        },
      ),
    );
  }
}
