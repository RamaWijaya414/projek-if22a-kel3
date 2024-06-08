import 'package:ecommerce_penjualan_bakso/event/event_db.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_penjualan_bakso/config/asset.dart';
import 'package:ecommerce_penjualan_bakso/screen/admin/dashboard_admin.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _controllerUsername = TextEditingController();
  var _controllerPass = TextEditingController();
  var _formKey = GlobalKey<FormState>();

  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
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
                        image: AssetImage('asset/images/Bakso.png'),
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
                    height: 20,
                  ),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (value) =>
                                value == '' ? 'Jangan Kosong' : null,
                            controller: _controllerUsername,
                            style: TextStyle(
                              color: Asset.colorPrimaryDark,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Username',
                              hintStyle: TextStyle(
                                color: Asset.colorPrimaryDark,
                              ),
                              filled: true,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal: 20,
                              ),
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
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 10.0),
                                child: Icon(
                                  Icons.people,
                                  color: Asset.colorPrimaryDark,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15, // Dikurangi sedikit
                          ),
                          TextFormField(
                            validator: (value) =>
                                value == '' ? 'Jangan Kosong' : null,
                            controller: _controllerPass,
                            style: TextStyle(
                              color: Asset.colorPrimaryDark,
                            ),
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                color: Asset.colorPrimaryDark,
                              ),
                              filled: true,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal: 20,
                              ),
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
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 10.0),
                                child: Icon(
                                  Icons.vpn_key,
                                  color: Asset.colorPrimaryDark,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20, // Diperpanjang sedikit
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Asset.colorSucces,
                            ),
                            width: double.infinity,
                            child: InkWell(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  EventDb.login(_controllerUsername.text,
                                      _controllerPass.text);
                                  _controllerUsername.clear();
                                  _controllerPass.clear();
                                }
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
