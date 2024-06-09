import 'package:flutter/material.dart';
import '../../model/food.dart';

class EditMinuman extends StatefulWidget {
  final Food drink;
  final Function(Food) onSave;
  final Function(Food) onUpdate;

  EditMinuman({
    required this.drink,
    required this.onSave,
    required this.onUpdate,
  });

  @override
  _EditMinumanState createState() => _EditMinumanState();
}

class _EditMinumanState extends State<EditMinuman> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TextEditingController _priceController;
  late TextEditingController _imageUrlController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.drink.title);
    _descriptionController = TextEditingController(text: widget.drink.description);
    _priceController = TextEditingController(text: widget.drink.price.toString());
    _imageUrlController = TextEditingController(text: widget.drink.imageUrl);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Minuman'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final updatedDrink = Food(
                title: _titleController.text,
                description: _descriptionController.text,
                price: double.parse(_priceController.text),
                imageUrl: _imageUrlController.text,
              );
              widget.onSave(updatedDrink);
              widget.onUpdate(updatedDrink);
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Judul'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Deskripsi'),
            ),
            TextField(
              controller: _priceController,
              decoration: InputDecoration(labelText: 'Harga'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _imageUrlController,
              decoration: InputDecoration(labelText: 'URL Gambar'),
            ),
          ],
        ),
      ),
    );
  }
}
