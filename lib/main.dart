import 'package:elevate_flutter_advanced_bootcamp/Screen/product/bloc/observer.dart';
import 'package:elevate_flutter_advanced_bootcamp/Screen/product/productscreen.dart';
import 'package:elevate_flutter_advanced_bootcamp/Screen/productdetails/product-details-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: ProductScreen.routeName,
      routes: {
        ProductScreen.routeName: (context) => const ProductScreen(),
        ProductDetailsScreen.routeName: (context) =>
            const ProductDetailsScreen(),
      },
    );
  }
}
