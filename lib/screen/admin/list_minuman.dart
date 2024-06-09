import 'package:flutter/material.dart';
import 'detail_minuman.dart';
import '../../model/food.dart';

class ListMinuman extends StatefulWidget {
  @override
  _ListMinumanState createState() => _ListMinumanState();
}

class _ListMinumanState extends State<ListMinuman> {
  List<Food> drinks = [
    Food(
      imageUrl: 'asset/images/esJeruk.png',
      title: 'Es Jeruk',
      description:
          'Minuman segar yang terbuat dari perasan jeruk segar. Es jeruk memiliki rasa manis asam yang khas dari buah jeruk, serta memberikan sensasi menyegarkan terutama saat disajikan dalam keadaan dingin. Cocok untuk dinikmati di hari panas atau sebagai teman santap siang.',
      price: 6000,
    ),
    Food(
      imageUrl: 'asset/images/esTeh.png',
      title: 'Es Teh',
      description:
          'Minuman segar yang disajikan dingin dengan es batu. Es teh biasanya terbuat dari air teh yang diberi tambahan rasa seperti melati, lemon, ceri, stroberi, atau susu. Minuman ini sangat cocok untuk dinikmati di hari panas karena memberikan sensasi menyegarkan dan menghilangkan dahaga. ',
      price: 5000,
    ),
  ];

  void _updateDrink(Food updatedDrink) {
    setState(() {
      int index =
          drinks.indexWhere((drink) => drink.title == updatedDrink.title);
      if (index != -1) {
        drinks[index] = updatedDrink;
      }
    });
  }

  void _navigateToDetailMinuman(Food drink) async {
    final updatedDrink = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            DetailMinuman(drink: drink, onUpdate: _updateDrink),
      ),
    );
    if (updatedDrink != null) {
      _updateDrink(updatedDrink);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Menu Minuman",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 22, 121, 171),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        leadingWidth: 30,
      ),
      body: ListView.builder(
        itemCount: drinks.length,
        itemBuilder: (context, index) {
          final drink = drinks[index];
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Card(
              elevation: 3,
              child: ListTile(
                contentPadding: EdgeInsets.all(16.0),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    drink.imageUrl,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(drink.title),
                subtitle: Text('Rp ${drink.price.toString()}'),
                onTap: () {
                  _navigateToDetailMinuman(drink);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
