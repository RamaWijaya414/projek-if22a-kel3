import 'package:ecommerce_penjualan_bakso/screen/admin/account_screen.dart';
import 'package:ecommerce_penjualan_bakso/screen/admin/newmenu_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_penjualan_bakso/config/asset.dart';
import 'package:ecommerce_penjualan_bakso/screen/admin/home_screen.dart';
import 'package:ecommerce_penjualan_bakso/screen/user/notifikasi.dart';
import 'package:ecommerce_penjualan_bakso/cart.dart';
import 'package:ecommerce_penjualan_bakso/screen/user/notifikasi.dart';

class DashboardAdmin extends StatefulWidget {
  const DashboardAdmin({Key? key}) : super(key: key);

  @override
  State<DashboardAdmin> createState() => _DashboardAdminState();
}

class _DashboardAdminState extends State<DashboardAdmin> {
  int _selectedIndex = 0;
  String _title = 'Home';

  final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    NotifikasiAdmin(),
    AddMenuPage(),
    AccountScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _title = 'Home';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Asset.colorPrimary, // Warna AppBar
        automaticallyImplyLeading: false,
        title: Text(
          _title,
          style: TextStyle(color: Colors.white), // Warna teks putih
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _selectedIndex,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedItemColor: Asset.colorPrimaryDark,
          selectedItemColor: Asset.colorPrimary,
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "Notification",
              icon: Icon(Icons.notifications),
            ),
            BottomNavigationBarItem(
              label: "Add",
              icon: Icon(Icons.add_shopping_cart),
            ),
            BottomNavigationBarItem(
              label: "Account",
              icon: Icon(Icons.account_circle),
            ),
          ],
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          _title = 'Beranda';
          break;
        case 1:
          _title = 'Notifikasi';
          break;
        case 2:
          _title = 'Tambah Menu';
          break;
        case 3:
          _title = 'Profil';
          break;
      }
    });
  }
}
