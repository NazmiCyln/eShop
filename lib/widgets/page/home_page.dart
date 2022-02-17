import 'dart:convert';
import 'package:circle_bottom_navigation_bar/circle_bottom_navigation_bar.dart';
import 'package:circle_bottom_navigation_bar/widgets/tab_data.dart';
import 'package:fake_store_api/widgets/page/search_page.dart';
import 'package:fake_store_api/widgets/page/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'basket_page.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}


//Örnek
// class tasari extends StatefulWidget {
//   @override
//   _tasariState createState() => _tasariState();
// }
//
// class _tasariState extends State<tasari> {
//   List<String> baslik = [];
//   List fiyat = [];
//   List<String> aciklama = [];
//   List<String> kategori = [];
//   List<String> image = [];
//
//   int seciliSayfa = 0;
//
//   //Apiden verileri çek listeyi doldur
//   Future getProductInfo() async {
//     var url = Uri.parse("https://fakestoreapi.com/products");
//
//     var data = await http.get(url);
//
//     var dataParsed = jsonDecode(data.body);
//
//     setState(() {
//       for (int i = 0; i < 20; i++) {
//         // baslik.add(dataParsed[i]["title"]);
//         fiyat.add(dataParsed[i]["price"].toString());
//         aciklama.add(dataParsed[i]["description"]);
//         kategori.add(dataParsed[i]["category"]);
//         image.add(dataParsed[i]["image"]);
//       }
//     });
//
//     void baslikAdd(String bslk) {
//       baslik.add(dataParsed[1]["title"]);
//     }
//   }
//
//   //Bottom Navigation Bar sayfaları
//   List sayfaGoster = [
//     HomePage(),
//     SearchPage(),
//     BasketPage(),
//     SettingsPage(),
//   ];
//
//   void sayfaDegistir(int index) {
//     setState(() {
//       seciliSayfa = index;
//     });
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     getProductInfo();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       child: baslik.isEmpty
//           ? const Center(
//               child: SpinKitSpinningLines(color: Colors.teal),
//             )
//           : Scaffold(
//               body: Center(
//                 child: sayfaGoster[seciliSayfa],
//               ),
//               bottomNavigationBar: CircleBottomNavigationBar(
//                 initialSelection: seciliSayfa,
//                 circleColor: Color(0xFF1D6C90),
//                 inactiveIconColor: Color(0xFF106182),
//                 circleOutline: -25,
//                 barHeight: MediaQuery.of(context).size.height * 0.078,
//                 barBackgroundColor: Color(0xFFE2EEFD),
//                 onTabChangedListener: (index) => sayfaDegistir(index),
//                 tabs: [
//                   TabData(icon: Icons.home),
//                   TabData(icon: Icons.search),
//                   TabData(icon: Icons.shopping_basket),
//                   TabData(icon: Icons.settings),
//                 ],
//               ),
//             ),
//     );
//   }
// }
