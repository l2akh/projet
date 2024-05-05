import 'package:flutter/material.dart';

class ingrediant extends StatelessWidget {
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
            _buildTextItem('Texte 1'),
            _buildTextItem('Texte 2'),
            _buildTextItem('Texte 3'),
          ],
        ),
      ),
    );
  }

  Widget _buildTextItem(String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.yellow, // Changez la couleur de fond en jaune
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black, // Changez la couleur du texte en noir
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
