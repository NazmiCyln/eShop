import 'package:fake_store_api/services/get_data.dart';
import 'package:fake_store_api/utilities/constants.dart';
import 'package:fake_store_api/utilities/dialog.dart';
import 'package:fake_store_api/widgets/products/product_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  late String category, sort;

  ProductList({required this.category, required this.sort});

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder(
        future: getProductInfoCategori("title", widget.category, widget.sort),
        builder: (BuildContext context, AsyncSnapshot dataTitle) {
          if (dataTitle.connectionState == ConnectionState.done) {
            return FutureBuilder(
              future:
                  getProductInfoCategori("image", widget.category, widget.sort),
              builder: (context, AsyncSnapshot dataImage) {
                if (dataImage.connectionState == ConnectionState.done) {
                  return FutureBuilder(
                    future: getProductInfoCategori(
                        "price", widget.category, widget.sort),
                    builder: (BuildContext context, AsyncSnapshot dataPrice) {
                      if (dataPrice.connectionState == ConnectionState.done) {
                        return FutureBuilder(
                          future: getProductInfoCategori(
                              "description", widget.category, widget.sort),
                          builder: (BuildContext context,
                              AsyncSnapshot dataDescription) {
                            if (dataDescription.connectionState ==
                                ConnectionState.done) {
                              return FutureBuilder(
                                future: getProductInfoCount(widget.category),
                                builder: (BuildContext context,
                                    AsyncSnapshot dataCount) {
                                  if (dataCount.connectionState ==
                                      ConnectionState.done) {
                                    return Container(
                                      color:
                                          ConstantsColor.PagesBackgroundColor,
                                      child: Column(
                                        children: [
                                          _buildFilterWidget(screenSize),
                                          Expanded(
                                            child: ListView.builder(
                                              itemCount: dataTitle.data.length,
                                              itemBuilder: (context, index) {
                                                return _buildProductDetail(
                                                  dataTitle.data[index]
                                                      .toString(),
                                                  dataImage.data[index]
                                                      .toString(),
                                                  dataPrice.data[index]
                                                      .toString(),
                                                  dataDescription.data[index]
                                                      .toString(),
                                                  dataCount.data[index]
                                                      .toString(),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  } else {
                                    return const Center(
                                      child: ConstantSpinkit.spinkitCircular,
                                    );
                                  }
                                },
                              );
                            } else {
                              return const Center(
                                child: ConstantSpinkit.spinkitCircular,
                              );
                            }
                          },
                        );
                      } else {
                        return const Center(
                          child: ConstantSpinkit.spinkitCircular,
                        );
                      }
                    },
                  );
                } else {
                  return const Center(
                    child: ConstantSpinkit.spinkitCircular,
                  );
                }
              },
            );
          } else {
            return const Center(
              child: ConstantSpinkit.spinkitCircular,
            );
          }
        },
      ),
    );
  }

  //Ürünlerin detayları
  _buildProductDetail(String title, String image, String price,
      String description, String count) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetails(
              title: title,
              description: description,
              imageUrl: image,
              price: price,
              count: count,
            ),
          ),
        );
      },
      child: Card(
        elevation: 7,
        margin: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
        //Kartın gölge rengi
        shadowColor: ConstantsColor.BottomNavigationBarInactiveIconColor,
        //Çerçeve stili, rengi, boyutu
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(22),
          side: const BorderSide(
            color: ConstantsColor.BottomNavigationBarCircleColor,
            width: 0.28,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            Container(
              child: Image.network(image),
              height: MediaQuery.of(context).size.height * 0.275,
              //genişlik olarak ekranın genişliğinin 2.2'sini al
              width: MediaQuery.of(context).size.width / 2,
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontSize: 16,
                            color: ConstantsColor.ProductListTitle,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Text(
                        "$price \$",
                        style: const TextStyle(
                            fontSize: 18,
                            color:
                                ConstantsColor.BottomNavigationBarCircleColor),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  OutlinedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetails(
                            title: title,
                            description: description,
                            imageUrl: image,
                            price: price,
                            count: count,
                          ),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.shopping_basket_outlined,
                      color: ConstantsColor.BottomNavigationBarCircleColor,
                    ),
                    label: const Text(
                      "Sepete Ekle",
                      style: TextStyle(
                        fontSize: 17,
                        color:
                            ConstantsColor.BottomNavigationBarInactiveIconColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //Butonların tasarımı
  _buildFilterWidget(Size screenSize) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 10, 15, 5),
      width: screenSize.width,
      child: Card(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
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

  //Filtrele ve sırala butonu tıklanma özelliği ve yazıları
  _buildFilterButton(String title) {
    return InkWell(
      onTap: () {
        if (title == "Sırala") {
          //Sıralamanın açılacağı ekran
          SiralamaDialog().siralaDialog(context, widget.category);
        } else if (title == "Filtrele") {
          //Filtrelemenin açılacağı ekran
          FiltrelemeDialog().filtreDialog(context);
        }
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
}
