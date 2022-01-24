import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

//TickerProviderStateMixin => TabController için gerekli
class _ProductDetailState extends State<ProductDetail>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Product Detail",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        //Appbardaki butonu oluşturduk, pop => nerden geldiysen geri git
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.chevron_left,
            size: 40,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.blueGrey,
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
              _builProductImages(),
              _builProductTitle(),
              const SizedBox(
                height: 12,
              ),
              _builProductPrice(),
              const SizedBox(
                height: 14,
              ),
              _buildDivider(size),
              const SizedBox(
                height: 12,
              ),
              _buildFurtherInfo(),
              const SizedBox(
                height: 12,
              ),
              _buildDivider(size),
              const SizedBox(
                height: 12,
              ),
              _buildSizeArea(),
              const SizedBox(
                height: 12,
              ),
              _buildInfo(),
            ],
          ),
        ),
      ],
    );
  }

  //Ürün fotolarını oluşturmak için
  _builProductImages() {
    TabController imagesController = TabController(length: 3, vsync: this);
    return Padding(
      padding: EdgeInsets.all(16),
      child: Container(
        height: 250,
        child: Center(
          //3 resim olduğunu belirtiyoruz
          child: DefaultTabController(
            length: 3,
            child: Stack(
              children: [
                //Resimlerin eklenmesi
                TabBarView(
                  controller: imagesController,
                  children: [
                    Image.network(
                        "https://aydinli-pc.akinoncdn.com/products/2019/10/30/295496/7ef9b731-3de4-439d-8ed8-e4b3ddc42b70_size1362x1770_quality100_cropCenter.jpg"),
                    Image.network(
                        "https://www.madmext.com/Uploads/UrunResimleri/Thumb/madmext-desenli-antrasit-balikci-yaka--b75c-4.jpg"),
                    Image.network(
                        "https://n11scdn.akamaized.net/a1/380_570/giyim-ayakkabi/kazak/madmext-antrasit-renk-bloklu-erkek-kazak-4734__0202294053092827.jpg"),
                  ],
                ),
                //Seçili resime göre hangi resimde olduğunu gösteren görüntü
                Container(
                  //konumunu belirliyoruz
                  alignment: const FractionalOffset(0.5, 0.99),
                  child: TabPageSelector(
                    controller: imagesController,
                    selectedColor: Colors.grey,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _builProductTitle() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Center(
        child: Text(
          "Jack Jones Kazak",
          style: TextStyle(
            fontSize: 17,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  _builProductPrice() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: const [
          Text(
            "\$200",
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            "\$400",
            style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
                decoration: TextDecoration.lineThrough),
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            "\%50 indirim",
            style: TextStyle(fontSize: 13, color: Colors.blue),
          ),
        ],
      ),
    );
  }

  //Fiyatın altına çekilen çizgi
  _buildDivider(Size screenSize) {
    return Column(
      children: [
        Container(
          color: Colors.blueGrey,
          //ekranın genişliği kadar
          width: screenSize.width,
          height: 0.5,
        ),
      ],
    );
  }

  //Ürün detaylı bilgi
  _buildFurtherInfo() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: const [
          Icon(
            Icons.local_offer,
            color: Colors.blueGrey,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "Daha fazla bilgi için tıklayınız",
            style: TextStyle(color: Colors.blueGrey),
          ),
        ],
      ),
    );
  }

  //Beden tablosu
  _buildSizeArea() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        //Maksimum büyüklükte boşluk bırak
        mainAxisSize: MainAxisSize.max,
        //Aralarına boşluk bırak ve bunu max olarak ayarla
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              Icon(
                Icons.straighten,
                color: Colors.blueGrey,
              ),
              SizedBox(
                width: 12,
              ),
              Text(
                "Beden : M",
                style: TextStyle(color: Colors.blueGrey),
              )
            ],
          ),
          Row(
            children: const [
              Text(
                "Beden Tablosu",
                style: TextStyle(color: Colors.blue, fontSize: 12),
              )
            ],
          ),
        ],
      ),
    );
  }

  //Ürün bilgisi
  _buildInfo() {
    //TabController ile iki farklı bilgi ekranı oluşturuyoruz
    //vsync farklı cihazlarda uyumluluk sağlar
    TabController tabController = TabController(length: 2, vsync: this);

    return Container(
      child: Column(
        children: [
          TabBar(
            controller: tabController,
            tabs: const [
              Tab(
                child: Text(
                  "Ürün Bilgisi",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                child: Text(
                  "Yıkama Bilgisi",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
          //barların içini TabBarView ile dolduruyoruz
          Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: TabBarView(
              controller: tabController,
              children: const [
                Text(
                  "%60 Pamuk, %30 Polyester",
                  style: TextStyle(color: Colors.blueGrey),
                ),
                Text(
                  "30 derecede yıkanabilir.",
                  style: TextStyle(color: Colors.blueGrey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //En aşağıdaki NavigationBar
  _buildButtonNavigationBar() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 36,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            //yapışık olsun
            fit: FlexFit.tight,
            //flex => orana göre dağıt. 2 oranında
            flex: 2,
            child: RaisedButton(
              onPressed: () {},
              color: Colors.blueGrey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.list,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    "İstek",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            //yapışık olsun
            fit: FlexFit.tight,
            //flex => orana göre dağıt. 3 oranında
            flex: 3,
            child: RaisedButton(
              onPressed: () {},
              color: Colors.greenAccent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.card_travel,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    "Sepete Ekle",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
