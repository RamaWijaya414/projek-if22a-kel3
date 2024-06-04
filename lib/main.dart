import 'package:ecommerce_penjualan_bakso/event/event_pref.dart';
import 'package:ecommerce_penjualan_bakso/model/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce_penjualan_bakso/config/asset.dart';
import 'package:ecommerce_penjualan_bakso/screen/admin/dashboard_admin.dart';
import 'package:ecommerce_penjualan_bakso/screen/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: Asset.colorPrimaryDark,
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: EventPref.getUser(),
        builder: (context, AsyncSnapshot<User?> snapshot) {
          return snapshot.data == null
              ? Login()
              : snapshot.data!.role == 'Admin'
                  ? DashboardAdmin()
                  : DashboardAdmin();
        },
      ),
    );
  }
}
