import 'package:flutter/material.dart';
import 'package:projet/auth/inscription.dart';
import 'package:projet/liste_plat.dart';

class Connexion extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(), // Empêcher le défilement
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0), // Ajout d'un espace supplémentaire
            Text(
              'Welcome to my App', // Ajout du texte de bienvenue
              style: TextStyle(
                  fontSize: 24.0,
                  color: Color(0xFF008080)), // Couleur bleu-vert
            ),
            SizedBox(height: 190.0), // Réduction de l'espace
            Container(
              width: 990.0,
              height: 625.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(255, 255, 255, 255),
                  ],
                ),
                border:
                    Border.all(color: const Color.fromARGB(255, 255, 255, 255)),
                borderRadius: BorderRadius.circular(30.0),
              ),
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 32.0),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 20.0), // Ajout de marge horizontale
                    child: Text(
                      'connecter vous',
                      style: TextStyle(
                          fontSize: 30.0,
                          color: const Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ),
                  SizedBox(height: 52.0),
                  TextField(
                    controller: _emailController,
                    cursorColor: const Color.fromARGB(255, 0, 0, 0),
                    decoration: InputDecoration(
                      labelText: 'Username',
                      labelStyle:
                          TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                      prefixIcon: Icon(Icons.person,
                          color: const Color.fromARGB(
                              255, 0, 0, 0)), // Ajout de l'icône de profil
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(60.0),
                        borderSide: BorderSide(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            width: 3.0),
                      ),
                    ),
                    style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                  ),
                  SizedBox(height: 32.0),
                  TextField(
                    controller: _passwordController,
                    cursorColor: const Color.fromARGB(255, 0, 0, 0),
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle:
                          TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                      prefixIcon: Icon(Icons.lock,
                          color: const Color.fromARGB(
                              255, 0, 0, 0)), // Ajout de l'icône de cadenas
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(60.0),
                        borderSide: BorderSide(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            width: 3.0),
                      ),
                    ),
                    style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                  ),
                  SizedBox(height: 35.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ListePlat()),
                      );
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 30.0,
                          color: const Color.fromARGB(255, 0, 0,
                              0)), // Changement de la couleur du texte
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(950, 64),
                      shape: RoundedRectangleBorder(
                        // Suppression des bords du bouton
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      primary: Color.fromARGB(
                          255, 255, 115, 0), // Changement de la couleur de fond
                    ),
                  ),
                  SizedBox(height: 20.0), // Espace supplémentaire
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Vous n-avez pas de compte?',
                        style: TextStyle(
                            fontSize: 10.0,
                            color: const Color.fromARGB(255, 0, 0, 0)),
                      ),
                      SizedBox(width: 5.0), // Espace
                      TextButton(
                        onPressed: () {
                          // Action à effectuer lors du clic sur le bouton S'inscrire
                          // Par exemple, naviguer vers la page d'inscription
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Inscription()),
                          );
                        },
                        child: Text(
                          "S'inscrire",
                          style: TextStyle(
                              fontSize: 10.0,
                              color: const Color.fromARGB(
                                  255, 0, 0, 255)), // Couleur bleue
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white, // Fond blanc
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Une classe Inscription fictive pour illustrer la navigation
