import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sys_test/cart_provider.dart';
import 'package:sys_test/global_variables.dart';
import 'package:sys_test/home_page.dart';
import 'package:sys_test/product_detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Shop App",
        // home: ProductDetailPage(
        //   product: products[0],
        // ),
        home: HomePage(),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromRGBO(240, 220, 1, 1),
            primary: Colors.amberAccent,
          ),
          appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
          fontFamily: "Lato",
          inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
          ),
          textTheme: TextTheme(
            titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            titleLarge: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
            bodySmall: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
