// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projeto_tcc_teste_sacolejando/src/store/order_store.dart';
import 'package:projeto_tcc_teste_sacolejando/src/widgets/bottom_navigator.dart';
import 'package:projeto_tcc_teste_sacolejando/src/widgets/custom_circular_indicator.dart';
import 'package:provider/provider.dart';
import '../../models/order_model.dart';

class OrderScreen extends StatelessWidget {
  late OrderStore _orderStore;

  @override
  Widget build(BuildContext context) {
    _orderStore = Provider.of<OrderStore>(context);
    _orderStore.getMyOrders();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Pedidos'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 180, 0, 0),
      ),
      body: Observer(
        builder: (context) => _buildOrderScreen(context),
      ),
      bottomNavigationBar: BottomNavigator(2),
    );
  }

  Widget _buildOrderScreen(context) {
    return Column(
      children: <Widget>[
        _orderStore.isLoading
            ? CustomCircularIndicator(
                textLabel: 'Carregando ...',
              )
            : _buildOrdersList(),
      ],
    );
  }

  Widget _buildOrdersList() {
    return Expanded(
      child: ListView.builder(
        itemCount: _orderStore.orders.length,
        itemBuilder: (context, index) {
          final Order order = _orderStore.orders[index];
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
          style: const TextStyle(color: Color.fromARGB(255, 180, 0, 0)),
        ),
        subtitle: Text(
          "Data: ${order.date}                           Status:${order.status}",
          style: const TextStyle(color: Color.fromARGB(255, 180, 0, 0)),
        ),
        trailing: const IconTheme(
          data: IconThemeData(color: Color.fromARGB(255, 180, 0, 0)),
          child: Icon(Icons.navigate_next),
        ),
        onTap: () {
          print(order.identify);
          Navigator.pushNamed(context, '/order_details', arguments: order);
        },
      ),
    );
  }
}
