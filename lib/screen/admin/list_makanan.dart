import 'package:flutter/material.dart';
import 'detail_makanan.dart';
import '../../model/food.dart';

class ListMakanan extends StatefulWidget {
  @override
  _ListMakananState createState() => _ListMakananState();
}

class _ListMakananState extends State<ListMakanan> {
  List<Food> foods = [
    Food(
      imageUrl: 'asset/images/baksoUrat.jpg',
      title: 'Makanan 1',
      description: 'Deskripsi Makanan 1',
      price: 10000,
    ),
    Food(
      imageUrl: 'asset/images/baksoTelor.jpeg',
      title: 'Makanan 2',
      description: 'Deskripsi Makanan 2',
      price: 20000,
    ),
  ];

  void _updateFood(Food updatedFood) {
    setState(() {
      int index = foods.indexWhere((food) => food.title == updatedFood.title);
      if (index != -1) {
        foods[index] = updatedFood;
      }
    });
  }

  void _navigateToDetailMakanan(Food food) async {
    final updatedFood = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailMakanan(food: food, onUpdate: _updateFood),
      ),
    );
    if (updatedFood != null) {
      _updateFood(updatedFood);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Daftar Makanan',
          style: TextStyle(
              color: Colors.white), // Atur warna teks judul menjadi putih
        ),
        backgroundColor: Colors.blue, // Atur warna latar belakang biru
      ),
      body: ListView.builder(
        itemCount: foods.length,
        itemBuilder: (context, index) {
          final food = foods[index];
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Card(
              elevation: 3, // Tingkat ketinggian kartu
              child: ListTile(
                contentPadding: EdgeInsets.all(16.0),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    food.imageUrl,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(food.title),
                subtitle: Text('Rp ${food.price.toString()}'),
                onTap: () {
                  _navigateToDetailMakanan(food);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}



