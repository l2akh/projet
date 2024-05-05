import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:projet/details_page.dart';

class NewMeal extends StatefulWidget {
  @override
  _NewMealState createState() => _NewMealState();
}

class _NewMealState extends State<NewMeal> {
  final TextEditingController _ingredientController = TextEditingController();
  final List<String> _ingredients = [];
  File? _image;

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  void _addIngredient(String ingredient) {
    setState(() {
      _ingredients.add(ingredient);
      _ingredientController.clear();
    });
  }

  void _removeIngredient(int index) {
    setState(() {
      _ingredients.removeAt(index);
    });
  }

  void _addMeal() {
    // Ajouter ici la logique pour ajouter le repas
    // Peut-être envoyer les informations à une base de données ou afficher un message de succès
  }
  void _displaySelectedImage() {
    if (_image != null) {
      // Affichez l'image sélectionnée ici
      print('Image Path: ${_image!.path}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.yellow),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Adding a new meal',
            style: TextStyle(color: Colors.yellow),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: 'Meal Name',
                  labelStyle: TextStyle(color: Colors.yellow),
                  prefixIcon: Icon(Icons.fastfood,
                      color: const Color.fromARGB(255, 0, 0, 0)),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: const Color.fromARGB(255, 0, 0, 0)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: const Color.fromARGB(255, 0, 0, 0)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(
                    width: 200, // Largeur fixe pour le bouton
                    child: _image == null
                        ? ElevatedButton.icon(
                            onPressed: _getImage,
                            icon: Icon(Icons.image),
                            label: Text('Select Image'),
                          )
                        : Container(
                            width: 100, // Largeur fixe pour l'aperçu
                            height: 100, // Hauteur fixe pour l'aperçu
                            child: Image.file(_image!, fit: BoxFit.cover),
                          ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color.fromARGB(255, 0, 0, 0)),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _ingredientController,
                            decoration: InputDecoration(
                              labelText: 'List of Ingredients',
                              labelStyle: TextStyle(color: Colors.grey),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onSubmitted: (value) {
                              _addIngredient(value);
                            },
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.add, color: Colors.yellow),
                          onPressed: () {
                            _addIngredient(_ingredientController.text);
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 0, 0, 0)),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: _ingredients.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: Icon(Icons.abc,
                                color: const Color.fromARGB(
                                    255, 0, 0, 0)), // Ajout de l'icône ici
                            title: Text(_ingredients[index]),
                            trailing: IconButton(
                              icon: Icon(Icons.remove, color: Colors.red),
                              onPressed: () {
                                _removeIngredient(index);
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Details(context: context, image: _image)),
                  );
                },
                child: Text(
                  'Add the meal',
                  style: TextStyle(
                    color: Colors.black, // Couleur du texte
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(
                      255, 255, 166, 0), // Couleur de fond du bouton
                  minimumSize:
                      Size(double.infinity, 50), // Dimensions du bouton
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
