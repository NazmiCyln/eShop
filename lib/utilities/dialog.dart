import 'package:fake_store_api/widgets/products/product_list.dart';
import 'package:flutter/material.dart';

class SiralamaDialog {
  siralaDialog(var context, String category) {
    Size size = MediaQuery.of(context).size;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          title: Text('Sırala'),
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: Column(
                children: <Widget>[
                  siralaButtons(
                    size,
                    Icons.list,
                    "Varsayılan",
                    context,
                    category,
                  ),
                  siralaButtons(
                    size,
                    Icons.filter_list_rounded,
                    "Büyükten Küçüğe",
                    context,
                    category,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

//Sıralama Dialogu button tasarımları
  Column siralaButtons(Size screenSize, IconData icon, String text, var context,
      String category) {
    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        GestureDetector(
          onTap: () {
            siralaButtonTiklama(text, context, category);
          },
          child: Row(
            children: [
              Icon(
                icon,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(text),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          color: Colors.blueGrey[200],
          //ekranın genişliği kadar
          width: screenSize.width,
          height: 0.5,
        ),
      ],
    );
  }

//Sıralama dialogu butonu tıklama özelliği
  siralaButtonTiklama(String text, var context, String category) {
    if (text == "Varsayılan") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ProductList(
            category: category,
            sort: "asc",
          ),
        ),
      );
    } else if (text == "Büyükten Küçüğe") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ProductList(
            category: category,
            sort: "desc",
          ),
        ),
      );
    }
  }
}

class FiltrelemeDialog{

  filtreDialog(var context){
    Size size = MediaQuery.of(context).size;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          title: Text('Filtrele'),
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: Column(
                children: <Widget>[

                ],
              ),
            ),
          ),
        );
      },
    );
  }

}
