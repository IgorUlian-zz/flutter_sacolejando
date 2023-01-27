import 'package:flutter/material.dart';
import 'package:projeto_tcc_teste_sacolejando/src/screens/home/home_screen_user2.dart';
import 'package:projeto_tcc_teste_sacolejando/src/screens/home/home_screen_user1.dart';
import 'package:projeto_tcc_teste_sacolejando/src/widgets/bottom_navigator_user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: const Color.fromARGB(255, 180, 0, 0),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            labelStyle: TextStyle(fontSize: 18, color: Colors.white),
            tabs: <Widget>[
              Tab(
                text: 'Categorias',
                icon: Icon(Icons.fastfood_outlined),
              ),
              Tab(
                text: 'Restaurantes',
                icon: Icon(Icons.restaurant_menu),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: HomeScreenUser1(),
            ),
            Center(
              child: HomeScreenUser2(),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigatorUser(0),
      ),
    );
  }
}
