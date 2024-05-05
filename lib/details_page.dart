import 'package:flutter/material.dart';
import 'liste_ingrediant.dart';
import 'dart:io';
// Importez la classe liste_ingrediant.dart

class Details extends StatelessWidget {
  final BuildContext context; // Ajoutez BuildContext comme variable membre

  final File? image; // Ajoutez une variable pour stocker l'image

  Details({
    required this.context,
    this.image, // Marquez l'image comme nullable
  }); // Constructeur avec BuildContext et l'image en paramètres

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
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save,
                  color: const Color.fromARGB(255, 255, 255, 255)),
              onPressed: () {
                // Ajoutez ici la logique pour sauvegarder le repas
              },
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: SizedBox(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildCard('Item 1', Icons.remove_red_eye, Icons.remove, image),
              _buildCard('Item 2', Icons.remove_red_eye, Icons.remove, image),
              _buildCard('Item 3', Icons.remove_red_eye, Icons.remove, image),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(String text, IconData icon1, IconData icon2, File? image) {
    return GestureDetector(
      onTap: () {
        // Naviguer vers la classe liste_ingrediant
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ingrediant()),
        );
      },
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 177, 174, 174),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Affichage conditionnel de l'image
            if (image != null)
              Container(
                width: 50, // Largeur de la miniature
                height: 50, // Hauteur de la miniature
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: FileImage(
                        image), // Utilisez FileImage pour afficher une image à partir du fichier
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            SizedBox(height: 10), // Espace entre l'image et le texte
            Text(
              text,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 10), // Espace entre le texte et les icônes
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  icon1,
                  color: Colors.white,
                ),
                Icon(
                  icon2,
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
