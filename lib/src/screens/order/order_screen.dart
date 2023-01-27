// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, avoid_print
import 'package:flutter/material.dart';
import 'package:projeto_tcc_teste_sacolejando/src/models/evaluation_model.dart';
import 'package:projeto_tcc_teste_sacolejando/src/models/food_model.dart';
import 'package:projeto_tcc_teste_sacolejando/src/widgets/bottom_navigator_user.dart';

import '../../models/order_model.dart';

class OrderScreen extends StatelessWidget {
  List<Order> listOrders = [
    Order(
      id: 1,
      userId: 1,
      foodId: 1,
      stPaymentId: 1,
      stOrderId: 1,
      orderPrice: '14,90',
      orderComment: 'Gostosão',
      orderDate: '02/11/2022',
      foods: [
        Food(
            id: 1,
            categoryId: 1,
            restaurantId: 1,
            foodName: 'X salada',
            foodPrice: '14,99',
            foodIngredients: 'Pão, queijo, presunto, salada e hamburguer')
      ],
      evaluations: [
        Evaluation(id: 1, userId: 1, stars: 3, comment: 'Gostoso esse Lanche'),
      ],
    ),
    Order(
      id: 1,
      userId: 1,
      foodId: 1,
      stPaymentId: 1,
      stOrderId: 1,
      orderPrice: '599,90',
      orderComment: 'Delicia',
      orderDate: '01/11/2022',
      foods: [
        Food(
            id: 1,
            categoryId: 1,
            restaurantId: 1,
            foodName: 'X salada',
            foodPrice: '14,99',
            foodIngredients: 'Pão, queijo, presunto, salada e hamburguer')
      ],
      evaluations: [
        Evaluation(id: 1, userId: 1, stars: 3, comment: 'Gostoso esse Lanche'),
      ],
    ),
    Order(
      id: 1,
      userId: 1,
      foodId: 1,
      stPaymentId: 1,
      stOrderId: 1,
      orderPrice: '599,90',
      orderComment: 'Gostosão',
      orderDate: '02/11/2022',
      foods: [
        Food(
            id: 1,
            categoryId: 1,
            restaurantId: 1,
            foodName: 'X salada',
            foodPrice: '14,99',
            foodIngredients: 'Pão, queijo, presunto, salada e hamburguer')
      ],
      evaluations: [
        Evaluation(id: 1, userId: 1, stars: 3, comment: 'Gostoso esse Lanche'),
      ],
    ),
    Order(
      id: 1,
      userId: 1,
      foodId: 1,
      stPaymentId: 1,
      stOrderId: 1,
      orderPrice: '599,90',
      orderComment: 'Delicia',
      orderDate: '01/11/2022',
      foods: [
        Food(
            id: 1,
            categoryId: 1,
            restaurantId: 1,
            foodName: 'X salada',
            foodPrice: '14,99',
            foodIngredients: 'Pão, queijo, presunto, salada e hamburguer')
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
      bottomNavigationBar: BottomNavigatorUser(2),
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
          "Pedido #${order.id}",
          style: const TextStyle(
            color: Color.fromARGB(255, 180, 0, 0),
          ),
        ),
        subtitle: Text(
          "Data #${order.orderDate}",
          style: const TextStyle(color: Colors.black),
        ),
        trailing: const IconTheme(
          data: IconThemeData(
            color: Color.fromARGB(255, 180, 0, 0),
          ),
          child: Icon(Icons.navigate_next),
        ),
        onTap: () {
          print(order.id);
          Navigator.pushNamed(context, '/order_details', arguments: order.id);
        },
      ),
    );
  }
}
