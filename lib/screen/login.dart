import 'package:flutter/material.dart';
import 'package:ecommerce_penjualan_bakso/config/asset.dart';
import 'package:ecommerce_penjualan_bakso/screen/admin/dashboard_admin.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          // Menggunakan Stack untuk menempatkan lingkaran di atas tombol login
          children: [
            Container(
              height: 760,
              decoration: BoxDecoration(
                color: Asset.colorPrimary,
              ),
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(
                left: 0,
                bottom: 0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                            'asset/images/Bakso.png'), // Ganti dengan path gambar Anda
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Form(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (value) =>
                                value == '' ? 'Jangan Kosong' : null,
                            style: TextStyle(
                              color: Asset.colorPrimaryDark,
                            ),
                            decoration: InputDecoration(
                                hintText: '  Username',
                                hintStyle: TextStyle(
                                  color: Asset.colorPrimaryDark,
                                ),
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 20),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide(
                                    color: Asset.colorPrimaryDark,
                                    width: 1,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide(
                                    color: Asset.colorPrimary,
                                    width: 2,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide(
                                    color: Asset.colorPrimary,
                                    width: 1,
                                  ),
                                ),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Icon(
                                    Icons.people,
                                    color: Asset.colorPrimaryDark,
                                  ),
                                )),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            validator: (value) =>
                                value == '' ? 'Jangan Kosong' : null,
                            style: TextStyle(
                              color: Asset.colorPrimaryDark,
                            ),
                            obscureText: true,
                            decoration: InputDecoration(
                                hintText: '  Password',
                                hintStyle: TextStyle(
                                  color: Asset.colorPrimaryDark,
                                ),
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 20),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide(
                                    color: Asset.colorPrimaryDark,
                                    width: 1,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide(
                                    color: Asset.colorPrimary,
                                    width: 2,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide(
                                    color: Asset.colorPrimary,
                                    width: 1,
                                  ),
                                ),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Icon(
                                    Icons.vpn_key,
                                    color: Asset.colorPrimaryDark,
                                  ),
                                )),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Asset.colorSucces,
                            ),
                            width: double.infinity,
                            child: InkWell(
                              onTap: () {
                                // Navigasi ke halaman dashboard admin ketika tombol login diklik
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DashboardAdmin(),
                                  ),
                                );
                              },
                              borderRadius: BorderRadius.circular(10),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 12,
                                ),
                                child: Text(
                                  'LOGIN',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
