import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddMenuPage extends StatefulWidget {
  const AddMenuPage({Key? key}) : super(key: key);

  @override
  State<AddMenuPage> createState() => _AddMenuPageState();
}

class _AddMenuPageState extends State<AddMenuPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  String? _imagePath;

  Future<void> _getImage() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imagePath = pickedFile.path;
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Process the data
      String name = _nameController.text;
      String description = _descriptionController.text;
      String price = _priceController.text;

      // Show a snackbar or dialog with the input data
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Menu Added: $name, $description, $price'),
        ),
      );

      // Navigasi ke home_screen.dart setelah menambahkan menu
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => DashboardAdmin()),
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              if (_imagePath != null) Image.file(File(_imagePath!)),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nama Makanan',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  hintText: 'Masukkan Nama Makanan',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Silakan masukkan nama makanan';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Deskripsi',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  hintText: 'Masukkan Deskripsi',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Silakan masukkan deskripsi';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(
                  labelText: 'Harga',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  hintText: 'Masukkan Harga',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Silakan masukkan harga';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Silakan masukkan angka yang valid';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _getImage,
                icon: Icon(Icons.upload),
                label: Text('Upload Gambar'),
                style: ElevatedButton.styleFrom(
                  padding:
                      EdgeInsets.symmetric(vertical: 16), // Ubah tinggi tombol
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _submitForm,
                icon: Icon(Icons.add),
                label: Text('Tambah Menu'),
                style: ElevatedButton.styleFrom(
                  padding:
                      EdgeInsets.symmetric(vertical: 16), // Ubah tinggi tombol
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    super.dispose();
  }
}

void main() {
  runApp(const MaterialApp(
    home: AddMenuPage(),
  ));
}
