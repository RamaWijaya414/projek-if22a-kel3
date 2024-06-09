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
      title: 'Bakso',
      description:
          'Nikmati kelezatan Bakso Spesial kami yang terbuat dari daging sapi pilihan dengan bumbu rahasia, menciptakan tekstur kenyal yang sempurna dan rasa yang kaya. Dalam setiap mangkuk, Anda akan menemukan kombinasi bakso urat, bakso telur, bakso keju, dan bakso ikan, disajikan dengan kuah kaldu sapi yang gurih, mie atau bihun lembut, serta sayuran segar.  Ayo, rasakan sensasi cita rasa yang menggugah selera bersama keluarga dan teman-teman Anda!',
      price: 15000,
    ),
    Food(
      imageUrl: 'asset/images/baksoTelor.jpeg',
      title: 'Bakso Telor',
      description:
          'Bakso dengan isian telor bulat dengan kuah kaldi sapi pilihan',
      price: 18000,
    ),
    Food(
      imageUrl: 'asset/images/baksoKerikil.jpg',
      title: 'Bakso Kerikil',
      description:
          'Bakso original dengan ukuran mini yang imut dengan kuah kaldu ayam yang spesial',
      price: 15000,
    ),
    Food(
      imageUrl: 'asset/images/baksoMercon.jpeg',
      title: 'Bakso Mercon',
      description:
          'Bakso yang berisi ulekan cabai dan beberapa irisan cabai merah pilihan dengan kuah kaldu sapi yang gurih',
      price: 20000,
    ),
    Food(
      imageUrl: 'asset/images/mieAyam.jpg',
      title: 'Mie Ayam',
      description: 'Mie ayam dengan racikan bumbu khas toko kami',
      price: 20000,
    ),
    Food(
      imageUrl: 'asset/images/mieAyamBakso.jpeg',
      title: 'Mie Ayam Bakso',
      description:
          'Mie ayam dengan racikan bumbu khas toko kami, dengan tambahan extra Bakso',
      price: 20000,
    ),
    Food(
      imageUrl: 'asset/images/mieBakso.jpg',
      title: 'Makanan 2',
      description:
          'Mie dengan racikan bumbu khas toko kami, dengan tambahan extra Bakso',
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
          "Menu Makanan",
          style: TextStyle(color: Colors.white), // Set the text color to white
        ),
        backgroundColor: Color.fromARGB(255, 22, 121, 171),
        iconTheme: IconThemeData(
          color: Colors.white, // Set the back button icon color to white
        ),
        leadingWidth: 30,
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
