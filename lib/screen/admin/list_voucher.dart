import 'package:flutter/material.dart';

// Class untuk merepresentasikan Voucher
class Voucher {
  final String title;
  final String description;
  final IconData icon;
  final Color backgroundColor;
  final String validity; // Tambah properti validity

  Voucher({
    required this.title,
    required this.description,
    required this.icon,
    required this.backgroundColor,
    required this.validity, // Inisialisasi properti validity
  });
}

// Kelas untuk menampilkan daftar voucher
class ListVoucher extends StatefulWidget {
  const ListVoucher({Key? key}) : super(key: key);

  @override
  State<ListVoucher> createState() => _ListVoucherState();
}

class _ListVoucherState extends State<ListVoucher> {
  // List Voucher
  List<Voucher> vouchers = [
    Voucher(
      title: "Potongan 5%",
      description: "Berlaku untuk pembelian minimal 100RB",
      icon: Icons.local_offer,
      backgroundColor: Colors.orange,
      validity: "31 Desember 2024", // Tambahkan keterangan berlaku masa
    ),
    Voucher(
      title: "Gratis Ongkir",
      description: "Min. belanja 10RB",
      icon: Icons.local_shipping,
      backgroundColor: Colors.green,
      validity: "30 Juni 2024", // Tambahkan keterangan berlaku masa
    ),
    Voucher(
      title: "Diskon 2%",
      description: "Berlaku untuk pembelian di atas 50RB",
      icon: Icons.monetization_on,
      backgroundColor: Colors.blue,
      validity: "15 Agustus 2024", // Tambahkan keterangan berlaku masa
    ),
    Voucher(
      title: "Diskon 10%",
      description: "Berlaku untuk pembelian minimal 300RB",
      icon: Icons.attach_money,
      backgroundColor: Colors.purple,
      validity: "28 Februari 2025", // Tambahkan keterangan berlaku masa
    ),
    // Tambahkan voucher lainnya sesuai kebutuhan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Daftar Voucher",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 22, 121, 171),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemCount: vouchers.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
            child: ListTile(
              leading: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: vouchers[index].backgroundColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Icon(
                    vouchers[index].icon,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ),
              title: Text(vouchers[index].title),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(vouchers[index].description),
                  SizedBox(height: 4),
                  Text(
                    "Berlaku : ${vouchers[index].validity}",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Voucher berhasil digunakan!"),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                child: Text(
                  "Gunakan",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 51, 153, 0),
                ),
              ),
              onTap: () {
                // Tambahkan logika ketika item voucher dipilih
                // Misalnya menampilkan detail voucher
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Tambahkan logika ketika tombol tambah voucher ditekan
        },
        child: Icon(
          Icons.add,
          color: Colors.white, // Set the plus icon color to white
        ),
        backgroundColor: Color.fromARGB(255, 22, 121, 171),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ListVoucher(),
  ));
}
