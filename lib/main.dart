import 'package:flutter/material.dart';
import 'package:projeto_tcc_teste_sacolejando/src/screens/cart/cart_screen.dart';
import 'package:projeto_tcc_teste_sacolejando/src/screens/evaluation/evaluation_screen.dart';
import 'package:projeto_tcc_teste_sacolejando/src/screens/food/food_screen.dart';
import 'package:projeto_tcc_teste_sacolejando/src/screens/profile/logout_screen.dart';
import 'package:projeto_tcc_teste_sacolejando/src/screens/restaurant/restaurant_screen.dart';
import 'package:projeto_tcc_teste_sacolejando/src/screens/signup/signup_screen.dart';
import 'package:projeto_tcc_teste_sacolejando/src/screens/splash_screen.dart';
import 'package:projeto_tcc_teste_sacolejando/src/screens/login/login_screen.dart';
import 'package:projeto_tcc_teste_sacolejando/src/screens/order/order_detail_screen.dart';
import 'package:projeto_tcc_teste_sacolejando/src/screens/order/order_screen.dart';
import 'package:projeto_tcc_teste_sacolejando/src/screens/profile/profile_user_screen.dart';
import 'package:projeto_tcc_teste_sacolejando/src/store/auth_store.dart';
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
        Provider<AuthStore>(
          create: (_) => AuthStore(),
        ),
        Provider<OrderStore>(
          create: (_) => OrderStore(),
        ),
      ],
      child: MaterialApp(
        initialRoute: '/restaurant',
        routes: {
          '/': (context) => SplashScreen(),
          '/register': (context) => SignUpScreen(),
          '/login': (context) => LoginScreen(),
          '/restaurant': (context) => RestaurantScreen(),
          '/food': (context) => FoodScreen(),
          '/cart': (context) => CartScreen(),
          '/order_user': (context) => OrderScreen(),
          '/order_details': (context) => OrderDetailScreen(),
          '/order_evaluation': (context) => EvaluationScreen(),
          '/user_profile': (context) => ProfileUserScreen(),
          '/logout': (context) => LogoutScreen(),
        },
      ),
    );
  }
}
