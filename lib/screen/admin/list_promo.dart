import 'package:ecommerce_penjualan_bakso/config/asset.dart';
import 'package:flutter/material.dart';

class ListPromo extends StatefulWidget {
  const ListPromo({Key? key});

  @override
  State<ListPromo> createState() => _ListPromoState();
}

class _ListPromoState extends State<ListPromo> {
  final List<Map<String, String>> promos = [
    {
      'image': 'asset/images/mieAyamBakso.jpeg',
      'name': 'Mie Ayam + Bakso',
      'price': '17000',
      'discount': '15',
    },
    {
      'image': 'asset/images/baksoTelor.jpeg',
      'name': 'Bakso Telor',
      'price': '13000',
      'discount': '15',
    },
    {
      'image': 'asset/images/mieAyam.jpg',
      'name': 'Mie Ayam',
      'price': '10000',
      'discount': '5',
    },
    {
      'image': 'asset/images/baksoUrat.jpg',
      'name': 'Bakso Urat',
      'price': '15000',
      'discount': '10',
    },
    {
      'image': 'asset/images/baksoKerikil.jpg',
      'name': 'Bakso Kerikil',
      'price': '15000',
      'discount': '10',
    },
    {
      'image': 'asset/images/baksoMercon.jpeg',
      'name': 'Bakso Mercon',
      'price': '18000',
      'discount': '10',
    },
  ];

  int calculateDiscountedPrice(String price, String discount) {
    int originalPrice = int.parse(price);
    double discountPercentage = double.parse(discount) / 100;
    return (originalPrice - (originalPrice * discountPercentage)).round();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Daftar Promo",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Asset.colorPrimary,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        leadingWidth: 30,
      ),
      body: ListView.builder(
        itemCount: promos.length,
        itemBuilder: (context, index) {
          int originalPrice = int.parse(promos[index]['price']!);
          int discountedPrice = calculateDiscountedPrice(
              promos[index]['price']!, promos[index]['discount']!);

          return Card(
            margin: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.asset(
                      promos[index]['image']!,
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        promos[index]['name']!,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Diskon: ${promos[index]['discount']}%',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600], // Ubah ke abu muda
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Rp. $originalPrice',
                            style: TextStyle(
                              fontSize: 14,
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey[600], // Ubah ke abu muda
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Rp. $discountedPrice',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Asset.colorPrimary,
      ),
    );
  }
}
