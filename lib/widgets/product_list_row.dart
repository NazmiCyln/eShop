import 'package:e_ticaret/utilities/constants.dart';
import 'package:flutter/material.dart';

class ProductListRow extends StatelessWidget {
  late String name, imageUrl;
  late int currentPrice, orginalPrice, discount;

  ProductListRow(
      {required this.name,
      required this.currentPrice,
      required this.orginalPrice,
      required this.discount,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildProductItemCard(context),
        _buildProductItemCard(context),
      ],
    );
  }

  //her bir ürün cardı
  _buildProductItemCard(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(Constants.ROUTE_PRODUCT_DETAIL);
      },
      child: Card(
        child: Column(
          children: [
            Container(
              child: Image.network(this.imageUrl),
              height: 250,
              //genişlik olarak ekranın genişliğinin 2.2'sini al
              width: MediaQuery.of(context).size.width / 2.2,
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    this.name,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "\$$currentPrice",
                        style:
                            const TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "\$$orginalPrice",
                        style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            //textin üstünü çiziyoruz
                            decoration: TextDecoration.lineThrough),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "\%$discount indirim",
                        style: const TextStyle(
                            fontSize: 12,
                            color: Colors.blue,),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
