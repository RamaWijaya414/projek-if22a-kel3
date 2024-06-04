import 'package:flutter/material.dart';

class NotifikasiPage extends StatelessWidget {
  const NotifikasiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildNotificationItem(
            profileImageUrl:
                'https://example.com/profile1.jpg', // URL gambar profil pengguna
            title: 'Promo Spesial!',
            description: 'Dapatkan diskon 50% untuk semua produk hari ini.',
            time: '2 jam yang lalu',
            onTap: () {
              // Logika ketika notifikasi ditekan
              print('Notifikasi "Promo Spesial" ditekan');
            },
          ),
          _buildNotificationItem(
            profileImageUrl:
                'https://example.com/profile2.jpg', // URL gambar profil pengguna
            title: 'Pengiriman Dipercepat',
            description:
                'Pengiriman pesanan Anda dipercepat dan akan sampai lebih cepat.',
            time: 'Kemarin',
            onTap: () {
              // Logika ketika notifikasi ditekan
              print('Notifikasi "Pengiriman Dipercepat" ditekan');
            },
          ),
          _buildNotificationItem(
            profileImageUrl:
                'https://example.com/profile3.jpg', // URL gambar profil pengguna
            title: 'Pesanan Diterima',
            description: 'Pesanan Anda dengan nomor #123456 telah diterima.',
            time: '3 hari yang lalu',
            onTap: () {
              // Logika ketika notifikasi ditekan
              print('Notifikasi "Pesanan Diterima" ditekan');
            },
          ),
          // Tambahkan item notifikasi lainnya di sini
        ],
      ),
    );
  }

  Widget _buildNotificationItem({
    required String profileImageUrl,
    required String title,
    required String description,
    required String time,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
            profileImageUrl), // Menggunakan NetworkImage untuk URL online
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
