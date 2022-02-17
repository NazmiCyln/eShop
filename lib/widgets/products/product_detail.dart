import 'package:fake_store_api/bottom_navigation_bar/navigation_bar.dart';
import 'package:fake_store_api/services/get_data.dart';
import 'package:fake_store_api/utilities/constants.dart';
import 'package:fake_store_api/widgets/page/basket_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductDetails extends StatefulWidget {
  late String title, description, imageUrl, price, count;

  ProductDetails({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.count,
  });

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails>
    with TickerProviderStateMixin {
  //Ürün beğenme color
  Color iconColor = Colors.black12;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Appbardaki butonu oluşturduk, pop => nerden geldiysen geri git
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
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BasketPage(
                      price: "",
                      imageUrl: "",
                      title: "",
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.shopping_basket_outlined,
                color: ConstantsColor.ProductListTitle,
                size: 36,
              ),
            ),
          ),
        ],
      ),
      body: _builProductDetails(context),
      bottomNavigationBar: _buildButtonNavigationBar(),
    );
  }

  //Ürün detaylarının görüntülendiği kısım
  _builProductDetails(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.all(4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Resim
              Padding(
                padding: EdgeInsets.all(16),
                child: Container(
                  height: 250,
                  child: Center(
                    child: Image.network(widget.imageUrl),
                  ),
                ),
              ),
              _buildDivider(size),
              const SizedBox(
                height: 12,
              ),
              //Başlık
              Center(
                child: Expanded(
                  child: Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              _buildDivider(size),
              const SizedBox(
                height: 12,
              ),
              //Fiyat bilgisi ve favoriye ekleme
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${widget.price} \$",
                      style: const TextStyle(
                          fontSize: 17,
                          color: ConstantsColor.BottomNavigationBarCircleColor),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (iconColor == Colors.black12) {
                            iconColor = Colors.red;
                            Fluttertoast.showToast(
                                msg: "Ürün favoriler listenize eklendi");
                          } else {
                            iconColor = Colors.black12;
                          }
                        });
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: iconColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              _buildDivider(size),
              const SizedBox(
                height: 4,
              ),
              //Ürün detayı
              _buildInfo(),
            ],
          ),
        ),
      ],
    );
  }

  //Tab Bar
  _buildInfo() {
    //TabController ile iki farklı bilgi ekranı oluşturuyoruz
    //vsync farklı cihazlarda uyumluluk sağlar
    TabController tabController = TabController(length: 2, vsync: this);
    return Container(
      child: Column(
        children: [
          TabBar(
            controller: tabController,
            indicatorColor: ConstantsColor.BottomNavigationBarCircleColor,
            tabs: const [
              Tab(
                child: Text(
                  "Ürün Bilgisi",
                  style: TextStyle(color: Colors.black87),
                ),
              ),
              Tab(
                child: Text(
                  "Adet Bilgisi",
                  style: TextStyle(color: Colors.black87),
                ),
              ),
            ],
          ),
          //barların içini TabBarView ile dolduruyoruz
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: TabBarView(
              controller: tabController,
              children: [
                Text(
                  widget.description,
                  style: const TextStyle(color: Colors.blueGrey),
                ),
                Text(
                  "${widget.count} adet ürün kalmıştır.",
                  style: const TextStyle(color: Colors.blueGrey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //BottomNavigationBar
  _buildButtonNavigationBar() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BasketPage(
                      title: widget.title,
                      imageUrl: widget.imageUrl,
                      price: widget.price,
                    ),
                  ),
                );
              },
              // color: Colors.green,
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                minimumSize: Size(
                  5,
                  MediaQuery.of(context).size.height,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.card_travel,
                    color: Colors.white,
                    size: 28,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Sepete Ekle",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  //çekilen çizgi
  _buildDivider(Size screenSize) {
    return Column(
      children: [
        Container(
          color: Colors.blueGrey[900],
          //ekranın genişliği kadar
          width: screenSize.width,
          height: 0.55,
        ),
      ],
    );
  }
}

//****************************
//****************************
//****************************
//****************************
// class ProductDetailaaaa extends StatefulWidget {
//   @override
//   _ProductDetailaaaaState createState() => _ProductDetailaaaaState();
// }
//
// //TickerProviderStateMixin => TabController için gerekli
// class _ProductDetailaaaaState extends State<ProductDetailaaaa>
//     with TickerProviderStateMixin {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text(
//           "Product Detail",
//           style: TextStyle(color: Colors.black, fontSize: 20),
//         ),
//         //Appbardaki butonu oluşturduk, pop => nerden geldiysen geri git
//         leading: IconButton(
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//           icon: const Icon(
//             Icons.chevron_left,
//             size: 40,
//             color: Colors.black,
//           ),
//         ),
//         backgroundColor: Colors.blueGrey,
//       ),
//       body: _builProductDetails(context),
//       bottomNavigationBar: _buildButtonNavigationBar(),
//     );
//   }
//
//   //Ürün detaylarının görüntülendiği kısım
//   _builProductDetails(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return ListView(
//       children: [
//         Container(
//           padding: EdgeInsets.all(4),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _builProductImages(),
//               _builProductTitle(),
//               const SizedBox(
//                 height: 12,
//               ),
//               _builProductPrice(),
//               const SizedBox(
//                 height: 14,
//               ),
//               _buildDivider(size),
//               const SizedBox(
//                 height: 12,
//               ),
//               _buildFurtherInfo(),
//               const SizedBox(
//                 height: 12,
//               ),
//               _buildDivider(size),
//               const SizedBox(
//                 height: 12,
//               ),
//               _buildSizeArea(),
//               const SizedBox(
//                 height: 12,
//               ),
//               _buildInfo(),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//   //Ürün fotolarını oluşturmak için
//   _builProductImages() {
//     TabController imagesController = TabController(length: 3, vsync: this);
//     return Padding(
//       padding: EdgeInsets.all(16),
//       child: Container(
//         height: 250,
//         child: Center(
//           //3 resim olduğunu belirtiyoruz
//           child: DefaultTabController(
//             length: 3,
//             child: Stack(
//               children: [
//                 //Resimlerin eklenmesi
//                 TabBarView(
//                   controller: imagesController,
//                   children: [
//                     Image.network(
//                         "https://aydinli-pc.akinoncdn.com/products/2019/10/30/295496/7ef9b731-3de4-439d-8ed8-e4b3ddc42b70_size1362x1770_quality100_cropCenter.jpg"),
//                     Image.network(
//                         "https://www.madmext.com/Uploads/UrunResimleri/Thumb/madmext-desenli-antrasit-balikci-yaka--b75c-4.jpg"),
//                     Image.network(
//                         "https://n11scdn.akamaized.net/a1/380_570/giyim-ayakkabi/kazak/madmext-antrasit-renk-bloklu-erkek-kazak-4734__0202294053092827.jpg"),
//                   ],
//                 ),
//                 //Seçili resime göre hangi resimde olduğunu gösteren görüntü
//                 Container(
//                   //konumunu belirliyoruz
//                   alignment: const FractionalOffset(0.5, 0.99),
//                   child: TabPageSelector(
//                     controller: imagesController,
//                     selectedColor: Colors.grey,
//                     color: Colors.white,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   _builProductTitle() {
//     return const Padding(
//       padding: EdgeInsets.symmetric(horizontal: 12),
//       child: Center(
//         child: Text(
//           "Jack Jones Kazak",
//           style: TextStyle(
//             fontSize: 17,
//             color: Colors.black,
//           ),
//         ),
//       ),
//     );
//   }
//
//   _builProductPrice() {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 12),
//       child: Row(
//         children: const [
//           Text(
//             "\$200",
//             style: TextStyle(fontSize: 16, color: Colors.black),
//           ),
//           SizedBox(
//             width: 8,
//           ),
//           Text(
//             "\$400",
//             style: TextStyle(
//                 fontSize: 12,
//                 color: Colors.grey,
//                 decoration: TextDecoration.lineThrough),
//           ),
//           SizedBox(
//             width: 8,
//           ),
//           Text(
//             "\%50 indirim",
//             style: TextStyle(fontSize: 13, color: Colors.blue),
//           ),
//         ],
//       ),
//     );
//   }
//
//   //Fiyatın altına çekilen çizgi
//   _buildDivider(Size screenSize) {
//     return Column(
//       children: [
//         Container(
//           color: Colors.blueGrey,
//           //ekranın genişliği kadar
//           width: screenSize.width,
//           height: 0.5,
//         ),
//       ],
//     );
//   }
//
//   //Ürün detaylı bilgi
//   _buildFurtherInfo() {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 12),
//       child: Row(
//         children: const [
//           Icon(
//             Icons.local_offer,
//             color: Colors.blueGrey,
//           ),
//           SizedBox(
//             width: 10,
//           ),
//           Text(
//             "Daha fazla bilgi için tıklayınız",
//             style: TextStyle(color: Colors.blueGrey),
//           ),
//         ],
//       ),
//     );
//   }
//
//   //Beden tablosu
//   _buildSizeArea() {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 12),
//       child: Row(
//         //Maksimum büyüklükte boşluk bırak
//         mainAxisSize: MainAxisSize.max,
//         //Aralarına boşluk bırak ve bunu max olarak ayarla
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: const [
//               Icon(
//                 Icons.straighten,
//                 color: Colors.blueGrey,
//               ),
//               SizedBox(
//                 width: 12,
//               ),
//               Text(
//                 "Beden : M",
//                 style: TextStyle(color: Colors.blueGrey),
//               )
//             ],
//           ),
//           Row(
//             children: const [
//               Text(
//                 "Beden Tablosu",
//                 style: TextStyle(color: Colors.blue, fontSize: 12),
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   //Ürün bilgisi
//   _buildInfo() {
//     //TabController ile iki farklı bilgi ekranı oluşturuyoruz
//     //vsync farklı cihazlarda uyumluluk sağlar
//     TabController tabController = TabController(length: 2, vsync: this);
//
//     return Container(
//       child: Column(
//         children: [
//           TabBar(
//             controller: tabController,
//             tabs: const [
//               Tab(
//                 child: Text(
//                   "Ürün Bilgisi",
//                   style: TextStyle(color: Colors.black),
//                 ),
//               ),
//               Tab(
//                 child: Text(
//                   "Yıkama Bilgisi",
//                   style: TextStyle(color: Colors.black),
//                 ),
//               ),
//             ],
//           ),
//           //barların içini TabBarView ile dolduruyoruz
//           Container(
//             height: 40,
//             padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
//             child: TabBarView(
//               controller: tabController,
//               children: const [
//                 Text(
//                   "%60 Pamuk, %30 Polyester",
//                   style: TextStyle(color: Colors.blueGrey),
//                 ),
//                 Text(
//                   "30 derecede yıkanabilir.",
//                   style: TextStyle(color: Colors.blueGrey),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   //En aşağıdaki NavigationBar
//   _buildButtonNavigationBar() {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       height: 36,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Flexible(
//             //yapışık olsun
//             fit: FlexFit.tight,
//             //flex => orana göre dağıt. 2 oranında
//             flex: 2,
//             child: RaisedButton(
//               onPressed: () {},
//               color: Colors.blueGrey,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: const [
//                   Icon(
//                     Icons.list,
//                     color: Colors.white,
//                   ),
//                   SizedBox(
//                     width: 4,
//                   ),
//                   Text(
//                     "İstek",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Flexible(
//             //yapışık olsun
//             fit: FlexFit.tight,
//             //flex => orana göre dağıt. 3 oranında
//             flex: 3,
//             child: RaisedButton(
//               onPressed: () {},
//               color: Colors.greenAccent,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: const [
//                   Icon(
//                     Icons.card_travel,
//                     color: Colors.white,
//                   ),
//                   SizedBox(
//                     width: 4,
//                   ),
//                   Text(
//                     "Sepete Ekle",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
