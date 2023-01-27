// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers, avoid_print
import 'package:flutter/material.dart';
import '../../widgets/bottom_navigator_user.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 180, 0, 0),
        title: const Text('Carrinho'),
        centerTitle: true,
      ),
      body: _buildContentCart(context),
      bottomNavigationBar: BottomNavigatorUser(1),
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
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(top: 12, left: 12),
      child: const Text(
        "Total (6) Items",
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget _buildCartList(context) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: 6,
      itemBuilder: (context, index) => _buildCartItem(context),
    );
  }

  Widget _buildCartItem(context) {
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
                _showDetailItemCart(context),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            height: 24,
            width: 24,
            margin: const EdgeInsets.only(top: 2, right: 6),
            decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(100))),
            child: const Icon(
              Icons.close,
              size: 20,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _showDetailItemCart(context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(top: 5, right: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Teste',
              maxLines: 2,
              style: TextStyle(
                fontSize: 14,
                color: Color.fromARGB(255, 180, 0, 0),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    "R\$ 59,90",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 180, 0, 0),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.remove,
                          size: 24,
                          color: Colors.grey.shade700,
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              top: 4, bottom: 4, left: 12, right: 12),
                          color: const Color.fromARGB(255, 180, 0, 0),
                          child: const Text(
                            '2',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Icon(
                          Icons.add,
                          size: 24,
                          color: Colors.grey.shade700,
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
      margin: const EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 50),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: Colors.orange,
      ),
      child: ElevatedButton(
        onPressed: () {
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
    );
  }

  Widget _buildTextTotalCart() {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 26, bottom: 16),
      child: const Text(
        "Preço total: R\$ 759,90",
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
