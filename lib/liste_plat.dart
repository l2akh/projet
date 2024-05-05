import 'package:flutter/material.dart';
import 'package:projet/details_page.dart';
import 'package:projet/new_meal.dart'; // Importez la classe NewMeal.dart

class ListePlat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'Home Page',
            style: TextStyle(color: Colors.yellow),
          ),
          centerTitle: true,
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: ListView(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          children: [
            _buildTextItem('Texte 1', Icons.remove_red_eye, Icons.add, context),
            _buildTextItem('Texte 2', Icons.remove_red_eye, Icons.add, context),
            _buildTextItem('Texte 3', Icons.remove_red_eye, Icons.add, context),
          ],
        ),
      ),
    );
  }

  Widget _buildTextItem(String text, IconData iconData1, IconData iconData2,
      BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Naviguer vers une interface différente en fonction de l'icône cliquée
        if (iconData1 == Icons.remove_red_eye) {
          // Naviguer vers une interface lorsque l'icône de gauche est cliquée
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Details(context: context)));
        } else if (iconData2 == Icons.add) {
          // Naviguer vers une interface lorsque l'icône de droite est cliquée
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewMeal()),
          );
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Icon(
              iconData1,
              color: Colors.black,
            ),
            SizedBox(width: 10),
            Icon(
              iconData2,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
