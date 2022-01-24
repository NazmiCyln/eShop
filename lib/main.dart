import 'package:e_ticaret/screens/product_list.dart';
import 'package:e_ticaret/utilities/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Ticaret',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductList(),
      routes: Routes.routes,
    );
  }
}

