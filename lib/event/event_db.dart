import 'dart:convert';
import 'package:get/get.dart';
import 'package:ecommerce_penjualan_bakso/config/api.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce_penjualan_bakso/event/event_pref.dart';
import 'package:ecommerce_penjualan_bakso/model/user.dart';
import 'package:ecommerce_penjualan_bakso/widget/info.dart';
import 'package:ecommerce_penjualan_bakso/screen/admin/dashboard_admin.dart';

class EventDb {
  static Future<User?> login(String username, String pass) async {
    User? user;

    try {
      var response = await http.post(Uri.parse(Api.login), body: {
        'text_username': username,
        'text_pass': pass,
      });

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);

        if (responBody['success']) {
          user = User.fromJson(responBody['user']);
          EventPref.saveUser(user);
          Info.snackbar('Login Berhasil');
          Future.delayed(Duration(milliseconds: 1700), () {
            Get.off(
              DashboardAdmin(),
            );
          });
        } else {
          Info.snackbar('Login Gagal');
        }
      } else {
        Info.snackbar('Request Login Gagal');
      }
    } catch (e) {
      print(e);
    }
    return user;
  }
}
