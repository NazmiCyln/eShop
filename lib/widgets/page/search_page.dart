import 'package:fake_store_api/bottom_navigation_bar/navigation_bar.dart';
import 'package:fake_store_api/services/get_data.dart';
import 'package:fake_store_api/utilities/constants.dart';
import 'package:fake_store_api/widgets/page/home_page.dart';
import 'package:fake_store_api/widgets/products/product_list.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantsColor.PagesBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => NavigationBar(),
              ),
            );
          },
          child: const Icon(
            Icons.arrow_back,
            color: ConstantsColor.BottomNavigationBarCircleColor,
          ),
        ),
      ),
      body: Container(
        // height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  _cardWidget(
                    "https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg",
                    "Erkek Giyim",
                    4,
                  ),
                  _cardWidget(
                    "https://fakestoreapi.com/img/81Zt42ioCgL._AC_SX679_.jpg",
                    "Elektronik",
                    30,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  _cardWidget(
                    "https://fakestoreapi.com/img/71HblAHs5xL._AC_UY879_-2.jpg",
                    "Kadın Giyim",
                    60,
                  ),
                  _cardWidget(
                    "https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg",
                    "Takı",
                    30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //Cardların tıklama özelliği ve tasarımları
  GestureDetector _cardWidget(
      String imageUrl, String category, double padding) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => category == "Erkek Giyim"
                ? ProductList(
                    category: "men's clothing",
                    sort: "asc",
                  )
                : category == "Kadın Giyim"
                    ? ProductList(
                        category: "women's clothing",
                        sort: "asc",
                      )
                    : category == "Elektronik"
                        ? ProductList(
                            category: "electronics",
                            sort: "asc",
                          )
                        : category == "Takı"
                            ? ProductList(
                                category: "jewelery",
                                sort: "asc",
                              )
                            : NavigationBar(),
          ),
        );
      },
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: padding),
            child: Card(
              elevation: 600,
              shadowColor: ConstantsColor.ProductListTitle,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(
                  color: ConstantsColor.BottomNavigationBarBackgroundColor,
                  width: 2,
                ),
              ),
              // shape: BeveledRectangleBorder(
              //   borderRadius: BorderRadius.circular(12),
              //   side: const BorderSide(
              //     color: ConstantsColor.PagesBackgroundColor,
              //     width: 0.28,
              //   ),
              // ),
              child: Container(
                padding: EdgeInsets.all(8),
                child: Image.network(
                  imageUrl,
                  height: MediaQuery.of(context).size.height * 0.26,
                  width: MediaQuery.of(context).size.width * 0.38,
                ),
              ),
            ),
          ),
          Text(category),
        ],
      ),
    );
  }
}

//Future kullanımı örnek
// class AramaPage extends StatefulWidget {
//   @override
//   _AramaPageState createState() => _AramaPageState();
// }
//
// class _AramaPageState extends State<AramaPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: GestureDetector(
//           onTap: () {
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => NavigationBar(),
//               ),
//             );
//           },
//           child: const Icon(
//             Icons.arrow_back,
//             color: ConstantsColor.BottomNavigationBarCircleColor,
//           ),
//         ),
//       ),
//       backgroundColor: Color(0xB7EFEFEF),
//       body: FutureBuilder(
//         future: getProductInfo("title"),
//         builder: (BuildContext context, AsyncSnapshot dataTitle) {
//           if (dataTitle.connectionState == ConnectionState.done) {
//             return SingleChildScrollView(
//               child: Container(
//                 height: MediaQuery.of(context).size.height,
//                 // color: Color(0x34015D79),
//                 padding: EdgeInsets.all(5),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Column(
//                       children: [
//                         _cardWidget(
//                           "https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg",
//                           "Erkek Giyim",
//                           4,
//                         ),
//                         _cardWidget(
//                           "https://fakestoreapi.com/img/81Zt42ioCgL._AC_SX679_.jpg",
//                           "Elektronik",
//                           30,
//                         ),
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         _cardWidget(
//                           "https://fakestoreapi.com/img/71HblAHs5xL._AC_UY879_-2.jpg",
//                           "Kadın Giyim",
//                           60,
//                         ),
//                         _cardWidget(
//                           "https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg",
//                           "Takı",
//                           30,
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           } else {
//             return const Center(
//               child: ConstantSpinkit.spinkitCircular,
//             );
//           }
//         },
//       ),
//     );
//   }
//
//   GestureDetector _cardWidget(
//       String imageUrl, String category, double padding) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => category == "Erkek Giyim"
//                 ? ProductList(category: "mens clothing")
//                 : category == "Kadın Giyim"
//                     ? ProductList(category: "women clothing")
//                     : category == "Elektronik"
//                         ? ProductList(category: "electronic")
//                         : category == "Takı"
//                             ? ProductList(category: "jewelery")
//                             : NavigationBar(),
//           ),
//         );
//       },
//       child: Card(
//         elevation: 10,
//         shadowColor: ConstantsColor.BottomNavigationBarInactiveIconColor,
//         child: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.only(top: padding),
//               child: Card(
//                 color: Color(0xEEF5F5F5),
//                 child: Container(
//                   padding: EdgeInsets.all(8),
//                   child: Image.network(
//                     imageUrl,
//                     height: MediaQuery.of(context).size.height * 0.28,
//                     width: MediaQuery.of(context).size.width * 0.41,
//                   ),
//                 ),
//               ),
//             ),
//             Text(category),
//           ],
//         ),
//       ),
//     );
//   }
// }
