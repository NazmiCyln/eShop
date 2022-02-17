import 'package:fake_store_api/utilities/constants.dart';
import 'package:flutter/material.dart';

class BasketPage extends StatefulWidget {
  late String title, imageUrl, price;

  BasketPage({
    required this.title,
    required this.imageUrl,
    required this.price,
  });

  @override
  _BasketPageState createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 35,
            color: ConstantsColor.ProductListTitle,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,

      ),
      body: Text("asd"),

    );
  }
}
