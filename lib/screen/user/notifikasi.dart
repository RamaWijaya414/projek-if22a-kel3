import 'package:flutter/material.dart';

class NotifikasiAdmin extends StatelessWidget {
  const NotifikasiAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildNotificationItem(
            profileImageAsset:
                'asset/images/user1.png', // Path gambar profil pengguna di lokal
            title: 'Pesanan',
            description: 'Anda Menerima Pesanan Baru dari Mr.Endi',
            time: '10 Menit yang lalu',
            onTap: () {
              // Logika ketika notifikasi ditekan
              print('Notifikasi "Pesanan" ditekan');
            },
          ),
          _buildNotificationItem(
            profileImageAsset:
                'asset/images/user2.png', // Path gambar profil pengguna di lokal
            title: 'Pesanan Spesial',
            description: 'Anda Menerima Pesanan Baru dari Mr.Bima',
            time: '14 Menit yang lalu',
            onTap: () {
              // Logika ketika notifikasi ditekan
              print('Notifikasi "Pesanan Spesial" ditekan');
            },
          ),
          _buildNotificationItem(
            profileImageAsset:
                'asset/images/user3.png', // Path gambar profil pengguna di lokal
            title: 'Pesanan',
            description: 'Anda Menerima Pesanan Baru dari Mr.Dye',
            time: '18 Menit yang lalu',
            onTap: () {
              // Logika ketika notifikasi ditekan
              print('Notifikasi "Pesanan" ditekan');
            },
          ),
          // Tambahkan item notifikasi lainnya di sini
        ],
      ),
    );
  }

  Widget _buildNotificationItem({
    required String profileImageAsset,
    required String title,
    required String description,
    required String time,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(
            profileImageAsset), // Menggunakan AssetImage untuk asset lokal
        radius: 25,
      ),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(description),
          SizedBox(height: 4),
          Text(
            time,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}
