import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

//Tüm ürünler listesinden verileri çek
Future getProductInfo(String variable) async {
  var url = Uri.parse("https://fakestoreapi.com/products");

  var data = await http.get(url);

  var dataParsed = jsonDecode(data.body);

  List<String> dataInfo = [];

  for (int i = 0; i < 20; i++) {
    dataInfo.add(dataParsed[i][variable]);
  }
  return dataInfo;
}

//verileri kategoriden çek
Future getProductInfoCategori(String variable, String category, String sort) async {
  var url = Uri.parse("https://fakestoreapi.com/products/category/$category?sort=$sort");

  var data = await http.get(url);

  var dataParsed = jsonDecode(data.body);

  List dataInfo = [];

  int index = 0;

  if (category == "men's clothing") {
    index = 4;
  } else if (category == "jewelery") {
    index = 4;
  } else if (category == "electronics") {
    index = 6;
  } else {
    index = 6;
  }

  for (int i = 0; i < index; i++) {
    dataInfo.add(dataParsed[i][variable]);
  }
  return dataInfo;
}

//kaç adet olduğunu çek
Future getProductInfoCount(String category) async {
  var url = Uri.parse("https://fakestoreapi.com/products/category/$category");

  var data = await http.get(url);

  var dataParsed = jsonDecode(data.body);

  List dataInfo = [];

  int index = 0;

  if (category == "men's clothing") {
    index = 4;
  } else if (category == "jewelery") {
    index = 4;
  } else if (category == "electronics") {
    index = 6;
  } else {
    index = 6;
  }

  for (int i = 0; i < index; i++) {
    dataInfo.add(dataParsed[i]["rating"]["count"]);
  }
  return dataInfo;
}


// class CartModel extends ChangeNotifier {
//   List<String> baslik = [];
//   List fiyat = [];
//   List<String> aciklama = [];
//   List<String> kategori = [];
//   List<String> image = [];
//
//   var dataParsed;
//
//   //Apiden verileri çek listeyi doldur
//   Future getProductInfo(String info) async {
//     var url = Uri.parse("https://fakestoreapi.com/products");
//
//     var data = await http.get(url);
//
//     dataParsed = jsonDecode(data.body);
//
//     for (int i = 0; i < 20; i++) {
//       baslik.add(dataParsed[i]["title"]);
//       fiyat.add(dataParsed[i]["price"].toString());
//       aciklama.add(dataParsed[i]["description"]);
//       kategori.add(dataParsed[i]["category"]);
//       image.add(dataParsed[i]["image"]);
//     }
//   }
//
//   void baslikAdd() {
//     baslik[0];
//     notifyListeners();
//   }
// }
