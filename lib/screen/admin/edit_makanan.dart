import 'package:flutter/material.dart';
import '../../model/food.dart';

class EditMakanan extends StatefulWidget {
  final Food food;
  final Function(Food) onSave;
  final Function(Food) onUpdate; // Tambahkan onUpdate di sini

  EditMakanan(
      {required this.food,
      required this.onSave,
      required this.onUpdate}); // Tambahkan onUpdate ke konstruktor

  @override
  _EditMakananState createState() => _EditMakananState();
}

class _EditMakananState extends State<EditMakanan> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TextEditingController _priceController;
  late TextEditingController _imageUrlController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.food.title);
    _descriptionController =
        TextEditingController(text: widget.food.description);
    _priceController =
        TextEditingController(text: widget.food.price.toString());
    _imageUrlController = TextEditingController(text: widget.food.imageUrl);
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
        title: Text('Edit Makanan'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final updatedFood = Food(
                title: _titleController.text,
                description: _descriptionController.text,
                price: double.parse(_priceController.text),
                imageUrl: _imageUrlController.text,
              );
              widget.onSave(updatedFood);
              widget.onUpdate(
                  updatedFood); // Panggil onUpdate untuk update tampilan DetailMakanan
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
