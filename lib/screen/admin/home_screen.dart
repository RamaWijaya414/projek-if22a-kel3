import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_penjualan_bakso/screen/admin/list_makanan.dart';
import 'package:ecommerce_penjualan_bakso/screen/admin/list_minuman.dart';
import 'package:ecommerce_penjualan_bakso/screen/admin/list_promo.dart';
import 'package:ecommerce_penjualan_bakso/screen/admin/list_voucher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce_penjualan_bakso/config/asset.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70, // Sesuaikan tinggi sesuai kebutuhan
        title: Container(
          margin: EdgeInsets.only(top: 20), // Tambahkan margin di bagian atas
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Color.fromRGBO(235, 234, 234, 0.475), // Warna abu transparan
            border: Border.all(
              color: Color.fromARGB(109, 3, 124, 237), // Stroke abu
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Makan apa ya hari ini ?',
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Icon(Icons.search),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.25, // 25% of screen height
              child: ListView(
                children: [
                  CarouselSlider(
                    items: [
                      BeritaTerkini('asset/images/1.png', '', ''),
                      BeritaTerkini('asset/images/2.png', '', ''),
                    ],
                    options: CarouselOptions(
                      height: screenHeight * 0.25,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 1.0,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 12, bottom: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton('Makanan', Icons.food_bank, 0),
                      IconButton('Minuman', Icons.coffee_rounded, 1),
                      IconButton('Promo', Icons.percent, 2),
                      IconButton('Voucher', Icons.discount, 3),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5,
                ),
                Text(" Semua Menu",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'asset/images/mieAyamBakso.jpeg',
                              height:
                                  screenHeight * 0.15, // 15% of screen height
                              width: double
                                  .infinity, // Make the image take full width of the container
                              fit: BoxFit
                                  .cover, // Make the image cover the container
                            ),
                            SizedBox(
                              height: 2.0,
                            ),
                            Text(
                              ' Mie Ayam + Bakso',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 0),
                            Text(
                              ' Harga: Rp. 20.000',
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'asset/images/baksoTelor.jpeg',
                              height: screenHeight * 0.15,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 2.0,
                            ),
                            Text(
                              ' Bakso Telor',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 0),
                            Text(
                              ' Harga: Rp. 15.000',
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'asset/images/mieAyam.jpg',
                              height: screenHeight * 0.15,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 2.0,
                            ),
                            Text(
                              ' Mie Ayam',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 0),
                            Text(
                              ' Harga: Rp. 10.000',
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'asset/images/baksoUrat.jpg',
                              height: screenHeight * 0.15,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 2.0,
                            ),
                            Text(
                              ' Bakso Urat',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 0),
                            Text(
                              ' Harga: Rp. 10.000',
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'asset/images/baksoUrat.jpg',
                              height: screenHeight * 0.15,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 2.0,
                            ),
                            Text(
                              ' Bakso Kerikil',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 0),
                            Text(
                              ' Harga: Rp. 12.000',
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'asset/images/baksoMercon.jpeg',
                              height: screenHeight * 0.15,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 2.0,
                            ),
                            Text(
                              ' Bakso Mercon',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 0),
                            Text(
                              ' Harga: Rp. 20.000',
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class IconButton extends StatelessWidget {
  final String nameLabel;
  final IconData iconLabel;
  final int index;

  IconButton(this.nameLabel, this.iconLabel, this.index);

  List<Map> _fragment = [
    {'title': 'Makanan', 'view': ListMakanan()},
    {'title': 'Minuman', 'view': ListMinuman()},
    {'title': 'Promo', 'view': ListPromo()},
    {'title': 'Voucher', 'view': ListVoucher()},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Material(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              elevation: 3,
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => _fragment[index]['view'],
                    ),
                  );
                },
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Center(
                    child: Icon(
                      iconLabel,
                      color: Asset.colorPrimary, // Warna biru
                      size: 40,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Text(
              nameLabel,
              style: TextStyle(fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}

class BeritaTerkini extends StatelessWidget {
  final String img;
  final String judul;
  final String tanggal;

  BeritaTerkini(this.img, this.judul, this.tanggal);
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.all(10),
      height: screenHeight * 0.25, // Adjust this as necessary
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                  image: AssetImage(img),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    judul,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    tanggal,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
