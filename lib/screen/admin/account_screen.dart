import 'package:ecommerce_penjualan_bakso/event/event_pref.dart';
import 'package:ecommerce_penjualan_bakso/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          SizedBox(
              height: MediaQuery.of(context)
                  .padding
                  .top), // Memberikan padding atas setara dengan status bar
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(
                'asset/images/user1.png'), // Ganti dengan path gambar yang sesuai
          ),
          SizedBox(height: 20),
          Text(
            'Mukhlis Khoirudin',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 2),
          Text(
            'Buka',
            style: TextStyle(
                fontSize: 16,
                color: Colors.green), // Mengubah warna menjadi hijau
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Tambahkan logika untuk mengubah profil di sini
            },
            child: Text('Edit Profil'),
          ),
          SizedBox(height: 20),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Informasi Akun'),
            onTap: () {
              // Tambahkan logika untuk menu Informasi Akun di sini
            },
          ),
          ListTile(
            leading: Icon(Icons.security),
            title: Text('Pengaturan Keamanan'),
            onTap: () {
              // Tambahkan logika untuk menu Pengaturan Keamanan di sini
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Pengaturan Aplikasi'),
            onTap: () {
              // Tambahkan logika untuk menu Pengaturan Aplikasi di sini
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Keluar'),
            onTap: () {
              EventPref.clear();
              Get.off(Login());
            },
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Profil',
    home: AccountScreen(),
  ));
}
