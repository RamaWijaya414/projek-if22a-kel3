import 'package:flutter/material.dart';
import 'package:ecommerce_penjualan_bakso/config/asset.dart';
import 'package:ecommerce_penjualan_bakso/screen/admin/home_screen.dart';

class DashboardAdmin extends StatefulWidget {
  const DashboardAdmin({Key? key}) : super(key: key);

  @override
  State<DashboardAdmin> createState() => _DashboardAdminState();
}

class _DashboardAdminState extends State<DashboardAdmin> {
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Color.fromARGB(255, 216, 216, 216),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(
                          left: 8.0, right: 8.0), // Atur padding ikon
                      child: Icon(Icons.search), // Menggunakan ikon pencarian
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                ),
              ),
              // IconButton(
              //   icon: Icon(Icons.search),
              //   onPressed: () {
              //     setState(() {
              //       _searchQuery = _searchController.text;
              //     });
              //   },
              // ),
            ],
          ),
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
              label: "Notifikasi",
              icon: Icon(Icons.notifications),
            ),
            BottomNavigationBarItem(
              label: "Keranjang",
              icon: Icon(Icons.trolley),
            ),
            BottomNavigationBarItem(
              label: "Akun",
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
    });
  }
}
