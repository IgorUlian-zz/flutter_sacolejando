// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers, avoid_print, must_be_immutable, unused_field, unnecessary_null_comparison, prefer_const_constructors, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projeto_tcc_teste_sacolejando/src/models/food_model.dart';
import 'package:projeto_tcc_teste_sacolejando/src/store/food_store.dart';
import 'package:projeto_tcc_teste_sacolejando/src/store/order_store.dart';
import 'package:projeto_tcc_teste_sacolejando/src/store/restaurant_store.dart';
import 'package:projeto_tcc_teste_sacolejando/src/widgets/bottom_navigator.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  late FoodStore _foodStore;
  late RestaurantStore _restaurantStore;
  late OrderStore _orderStore;
  final TextEditingController _commentController = TextEditingController();

  late String titleRestaurant = _restaurantStore.restaurant != null
      ? "Carrinho - ${_restaurantStore.restaurant!.tenant_name}"
      : "Carrinho";

  @override
  Widget build(BuildContext context) {
    _foodStore = Provider.of<FoodStore>(context);
    _restaurantStore = Provider.of<RestaurantStore>(context);
    _orderStore = Provider.of<OrderStore>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 180, 0, 0),
        title: Text(titleRestaurant),
        centerTitle: true,
      ),
      body: _buildContentCart(context),
      bottomNavigationBar: BottomNavigator(1),
    );
  }

  Widget _buildContentCart(context) {
    return ListView(
      shrinkWrap: false,
      children: <Widget>[
        _buildHeader(),
        _buildCartList(context),
        _buildTextTotalCart(),
        _buildFormComment(context),
        _buildCheckout(context),
      ],
    );
  }

  Widget _buildHeader() {
    return Observer(
      builder: (BuildContext context) => Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.only(top: 12, left: 12),
        child: Text(
          "Total (${_foodStore.cartItems.length})Items",
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildCartList(context) {
    return Observer(
      builder: (context) => ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: _foodStore.cartItems.length,
        itemBuilder: (context, index) {
          final Map<String, dynamic> itemCart = _foodStore.cartItems[index];
          return _buildCartItem(itemCart, context);
        },
      ),
    );
  }

  Widget _buildCartItem(Map<String, dynamic> itemCart, context) {
    final Food food = itemCart['food'];
    return Stack(
      children: <Widget>[
        Container(
          height: 100,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            border: Border.all(color: Colors.grey.shade200),
            borderRadius: const BorderRadius.all(Radius.circular(16)),
          ),
          child: Container(
            child: Row(
              children: <Widget>[
                SizedBox(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40.0),
                    child: Image.asset('assets/acai_red.png'),
                  ),
                ),
                _showDetailItemCart(food, itemCart, context),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: GestureDetector(
            onTap: () => _foodStore.removeFoodCart(food),
            child: Container(
              height: 24,
              width: 24,
              margin: EdgeInsets.only(top: 2, right: 4),
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(100))),
              child: Icon(
                Icons.close,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _showDetailItemCart(
      Food food, Map<String, dynamic> itemCard, context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(top: 5, right: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              food.food_name,
              maxLines: 2,
              style: const TextStyle(
                fontSize: 14,
                color: Color.fromARGB(255, 180, 0, 0),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "R\$ ${food.price}",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 180, 0, 0),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => _foodStore.decrementFoodCart(food),
                          child: Icon(
                            Icons.remove,
                            size: 24,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              top: 4, bottom: 4, left: 12, right: 12),
                          color: const Color.fromARGB(255, 180, 0, 0),
                          child: Text(
                            itemCard['quantity'].toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => _foodStore.incrementFoodCart(food),
                          child: Icon(
                            Icons.add,
                            size: 24,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormComment(context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        controller: _commentController,
        autocorrect: true,
        style: const TextStyle(
          color: Color.fromARGB(255, 180, 0, 0),
        ),
        cursorColor: const Color.fromARGB(255, 180, 0, 0),
        onSaved: (value) {
          print(value);
        },
        decoration: InputDecoration(
          labelText: 'Comentário (exemplo: sem alho)',
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
    );
  }

  Widget _buildCheckout(context) {
    return Container(
      child: Observer(
        builder: (context) => ElevatedButton(
          onPressed: () {
            _orderStore.isCreateOrder ? null : _createOrder(context);
            _orderStore.isCreateOrder
                ? Text('Fazendo pedido ...',
                    style: TextStyle(
                      color: Colors.white,
                    ))
                : Text('Finalizar pedido',
                    style: TextStyle(
                      color: Colors.white,
                    ));
            print('checkout');
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
          ),
          child: const Text(
            "Finalizar Pedido",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextTotalCart() {
    return Observer(
      builder: (context) => Container(
        margin: const EdgeInsets.only(left: 10, right: 10, top: 26, bottom: 16),
        child: Text(
          "Preço total: R\$ ${_foodStore.totalCart}",
          style: const TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Future _createOrder(context) async {
    await _orderStore.createOrder(
        _restaurantStore.restaurant!.uuid, _foodStore.cartItems,
        order_comment: _commentController.text);

    _foodStore.clearCart();
    _commentController.text = '';

    Navigator.pushReplacementNamed(context, '/order_user');
  }
}
