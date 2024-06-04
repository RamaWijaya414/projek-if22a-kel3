import 'package:flutter/material.dart';
import 'package:ecommerce_penjualan_bakso/config/asset.dart';

class ListMakanan extends StatefulWidget {
  const ListMakanan({super.key});

  @override
  State<ListMakanan> createState() => _ListMakananState();
}

class _ListMakananState extends State<ListMakanan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Menu Makanan",
          style: TextStyle(color: Colors.white), // Set the text color to white
        ),
        backgroundColor: Asset.colorPrimary,
        iconTheme: IconThemeData(
          color: Colors.white, // Set the back button icon color to white
        ),
        leadingWidth:
            30, // Decrease the space between the back button and title
      ),
      body: Stack(
        children: [
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton(
              onPressed: () {},
              child: Icon(
                Icons.add,
                color: Colors.white, // Set the plus icon color to white
              ),
              backgroundColor: Asset.colorPrimary,
            ),
          )
        ],
      ),
    );
  }
}
