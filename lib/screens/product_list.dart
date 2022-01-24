import 'package:e_ticaret/widgets/product_list_row.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: const Text(
          "Product List",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
      body: _buildProductListPage(),
    );
  }

  //Ürünlerin listelendiği ana sayfadaki ekranın body kısmı
  _buildProductListPage() {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          //index satır numarasını belirtiyor
          if (index == 0) {
            return _buildFilterWidgets(screenSize);
          } else if (index == 4) {
            return const SizedBox(
              height: 12,
            );
          } else {
            return _buildProductListRow();
          }
        },
      ),
    );
  }

  //Sırala ve Filtrele butonlarının olduğu kısım
  _buildFilterWidgets(Size screenSize) {
    return Container(
      margin: EdgeInsets.all(12),
      width: screenSize.width,
      child: Card(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildFilterButton("Sırala"),
              Container(
                color: Colors.black,
                width: 2,
                height: 24,
              ),
              _buildFilterButton("Filtrele"),
            ],
          ),
        ),
      ),
    );
  }

  //Butonların yazıları ve tıklanma özelliği
  _buildFilterButton(String title) {
    return InkWell(
      onTap: (){
        print(title);
      },
      child: Row(
        children: [
          const Icon(
            Icons.arrow_drop_down,
            color: Colors.black,
          ),
          const SizedBox(
            width: 2,
          ),
          Text(title),
        ],
      ),
    );
  }

  //Ürünlerin gösterildiği cardların bilgisi
  _buildProductListRow() {
    return ProductListRow(
        name: "Kazak",
        currentPrice: 200,
        orginalPrice: 400,
        discount: 50,
        imageUrl:
            "https://aydinli-pc.akinoncdn.com/products/2019/10/30/295496/7ef9b731-3de4-439d-8ed8-e4b3ddc42b70_size1362x1770_quality100_cropCenter.jpg");
  }
}
