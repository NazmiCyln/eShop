import 'package:circle_bottom_navigation_bar/circle_bottom_navigation_bar.dart';
import 'package:circle_bottom_navigation_bar/widgets/tab_data.dart';
import 'package:fake_store_api/utilities/constants.dart';
import 'package:fake_store_api/widgets/page/search_page.dart';
import 'package:fake_store_api/widgets/page/settings_page.dart';
import 'package:fake_store_api/widgets/page/home_page.dart';
import 'package:fake_store_api/widgets/page/basket_page.dart';
import 'package:flutter/material.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int seciliSayfa = 0;

  //Bottom Navigation Bar sayfaları
  List sayfaGoster = [
    HomePage(),
    SearchPage(),
    BasketPage(title: "", imageUrl: "", price: "",),
    SettingsPage(),
  ];

  void sayfaDegistir(int index) {
    setState(() {
      seciliSayfa = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: sayfaGoster[seciliSayfa],
      ),
      bottomNavigationBar: CircleBottomNavigationBar(
        initialSelection: seciliSayfa,
        circleColor: ConstantsColor.BottomNavigationBarCircleColor,
        inactiveIconColor: ConstantsColor.BottomNavigationBarInactiveIconColor,
        circleOutline: -60,
        barHeight: MediaQuery.of(context).size.height * 0.078,
        barBackgroundColor: ConstantsColor.BottomNavigationBarBackgroundColor,
        onTabChangedListener: (index) => sayfaDegistir(index),
        tabs: [
          TabData(icon: Icons.home),
          TabData(icon: Icons.search),
          TabData(icon: Icons.shopping_basket),
          TabData(icon: Icons.settings),
        ],
      ),
    );
  }
}
