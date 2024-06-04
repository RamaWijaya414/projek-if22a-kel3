import 'package:ecommerce_penjualan_bakso/config/asset.dart';
import 'package:flutter/material.dart';

class ListVoucher extends StatefulWidget {
  const ListVoucher({super.key});

  @override
  State<ListVoucher> createState() => _ListVoucherState();
}

class _ListVoucherState extends State<ListVoucher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Daftar Voucher",
          style: TextStyle(color: Colors.white), // Set the text color to white
        ),
        backgroundColor: Asset.colorPrimary,
        iconTheme: IconThemeData(
          color: Colors.white, // Set the back button icon color to white
        ),
        leadingWidth: 30,
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
