// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:projeto_tcc_teste_sacolejando/src/screens/cart/cart_screen.dart';
import 'package:projeto_tcc_teste_sacolejando/src/screens/evaluation/evaluation_screen.dart';
import 'package:projeto_tcc_teste_sacolejando/src/screens/food/food_screen.dart';
import 'package:projeto_tcc_teste_sacolejando/src/screens/home/home_screen_tenant.dart';
import 'package:projeto_tcc_teste_sacolejando/src/screens/home/splash_screen.dart';
import 'package:projeto_tcc_teste_sacolejando/src/screens/login/login_screen.dart';
import 'package:projeto_tcc_teste_sacolejando/src/screens/order/order_detail_screen.dart';
import 'package:projeto_tcc_teste_sacolejando/src/screens/order/order_screen.dart';
import 'package:projeto_tcc_teste_sacolejando/src/screens/profile/profile_user_screen.dart';
import 'package:projeto_tcc_teste_sacolejando/src/store/category_store.dart';
import 'package:projeto_tcc_teste_sacolejando/src/store/food_store.dart';
import 'package:projeto_tcc_teste_sacolejando/src/store/order_store.dart';
import 'package:projeto_tcc_teste_sacolejando/src/store/restaurant_store.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FoodStore>(
          create: (_) => FoodStore(),
        ),
        Provider<CategoryStore>(
          create: (_) => CategoryStore(),
        ),
        Provider<RestaurantStore>(
          create: (_) => RestaurantStore(),
        ),
        Provider<OrderStore>(
          create: (_) => OrderStore(),
        ),
      ],
      child: MaterialApp(
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => const SplashScreen(),
          '/login': (context) => const LoginScreen(),
          '/home': (context) => const HomeScreenTenant(),
          '/food': (context) => const FoodScreen(),
          '/cart': (context) => CartScreen(),
          '/order_user': (context) => OrderScreen(),
          '/order_details': (context) => OrderDetailScreen(),
          '/order_evaluation': (context) => const EvaluationScreen(),
          '/user_profile': (context) => ProfileUserScreen(),
        },
      ),
    );
  }
}
