import 'package:ecommerce_penjualan_bakso/config/asset.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import library untuk formatting mata uang

class CartItem {
  final String productName;
  final double price;
  int quantity;

  CartItem({
    required this.productName,
    required this.price,
    this.quantity = 1,
  });
}

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<CartItem> cartItems = [
    CartItem(
      productName: 'Bakso Urat',
      price: 10000,
    ),
    CartItem(
      productName: 'Mie Ayam + Bakso',
      price: 15000,
    ),
    // Add more items if needed
  ];

  // Fungsi untuk memformat harga menjadi mata uang Rupiah
  String formatCurrency(double amount) {
    final currencyFormat =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);
    return currencyFormat.format(amount);
  }

  // Fungsi untuk menghitung total harga semua item dalam keranjang
  double _totalPrice() {
    double total = 0.0;
    for (var item in cartItems) {
      total += item.price * item.quantity;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(
                          'assets/${cartItems[index].productName.toLowerCase()}.jpg'),
                    ),
                    title: Text(cartItems[index].productName),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 4.0),
                        Text(
                          'Harga: ${formatCurrency(cartItems[index].price)}',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            setState(() {
                              if (cartItems[index].quantity > 1) {
                                cartItems[index].quantity--;
                              }
                            });
                          },
                        ),
                        Text(cartItems[index].quantity.toString()),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              cartItems[index].quantity++;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Total Bayar : ${formatCurrency(_totalPrice())}',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                FloatingActionButton.extended(
                  onPressed: () {
                    // Tambahkan logika untuk "Pesan Sekarang" di sini
                  },
                  label: Text(
                    'Pesan Sekarang',
                    style: TextStyle(
                      color:
                          Colors.white, // Menetapkan warna teks menjadi putih
                    ),
                  ),
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.white, // Menetapkan warna ikon menjadi putih
                  ),
                  backgroundColor: Asset.colorPrimary,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Cart(),
  ));
}
