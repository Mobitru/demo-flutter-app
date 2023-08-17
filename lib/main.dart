import 'package:flutter/material.dart';
import 'package:flutter_demo_app/router/router.dart';
import 'package:flutter_demo_app/di/inject.dart';
import 'package:flutter_demo_app/state/auth_state.dart';
import 'package:flutter_demo_app/state/cart_state.dart';
import 'package:flutter_demo_app/state/orders_state.dart';
import 'package:flutter_demo_app/state/products_state.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthState>(create: (context) => GetIt.instance.get<AuthState>()),
        ChangeNotifierProvider<CartState>(create: (context) => GetIt.instance.get<CartState>()),
        ChangeNotifierProvider<ProductsState>(
            create: (context) => GetIt.instance.get<ProductsState>()),
        ChangeNotifierProvider<OrdersState>(create: (context) => GetIt.instance.get<OrdersState>()),
      ],
      child: MaterialApp.router(
        //showSemanticsDebugger: true,
        routerConfig: router,
        theme: ThemeData(
          textTheme: const TextTheme(
            titleLarge: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            bodyMedium: TextStyle(fontSize: 14.0,fontWeight: FontWeight.w500,),
            bodySmall: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600, height: 1.3),
            bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
