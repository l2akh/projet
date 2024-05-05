import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projet/auth/connextion.dart';

class Inscription extends StatefulWidget {
  const Inscription({Key? key}) : super(key: key);

  @override
  _InscriptionState createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _numeroController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              Text(
                'Create your account',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 80.0),
              Container(
                width: 990.0,
                height: 790.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 255, 255, 255),
                      Color.fromARGB(255, 255, 255, 255),
                    ],
                  ),
                  border: Border.all(
                      color: const Color.fromARGB(255, 255, 255, 255)),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 32.0),
                    Text(
                      'Inscription',
                      style: TextStyle(fontSize: 30.0, color: Colors.white),
                    ),
                    SizedBox(height: 32.0),
                    _buildTextField(_nomController, 'Username', Icons.person),
                    SizedBox(height: 15.0),
                    _buildEmailField(),
                    SizedBox(height: 15.0),
                    _buildTextField(_numeroController, 'Numero', Icons.phone,
                        TextInputType.number),
                    SizedBox(height: 15.0),
                    _buildPasswordField(),
                    SizedBox(height: 15.0),
                    _buildConfirmPasswordField(),
                    SizedBox(height: 35.0),
                    ElevatedButton(
                      onPressed: _registerUser,
                      child: Text('Sign Up',
                          style:
                              TextStyle(fontSize: 17.0, color: Colors.black)),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(950, 64),
                        backgroundColor: Color.fromARGB(255, 255, 115, 0),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text('OR',
                        style: TextStyle(fontSize: 20.0, color: Colors.black)),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Connexion(),
                          ),
                        );
                      },
                      child: Text('Sign in with Google',
                          style:
                              TextStyle(fontSize: 30.0, color: Colors.black)),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(950, 64),
                        backgroundColor: Color.fromARGB(255, 255, 115, 0),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Already have an account?',
                            style:
                                TextStyle(fontSize: 10.0, color: Colors.black)),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Connexion()),
                            );
                          },
                          child: Text('Login',
                              style: TextStyle(
                                  fontSize: 17.0, color: Colors.black)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String labelText, IconData icon,
      [TextInputType? inputType]) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      cursorColor: const Color.fromARGB(255, 0, 0, 0),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
        prefixIcon: Icon(icon, color: const Color.fromARGB(255, 0, 0, 0)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(60.0),
          borderSide:
              BorderSide(color: const Color.fromARGB(255, 0, 0, 0), width: 3.0),
        ),
      ),
      style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      cursorColor: const Color.fromARGB(255, 0, 0, 0),
      decoration: InputDecoration(
        labelText: 'E-mail',
        labelStyle: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
        prefixIcon:
            Icon(Icons.email, color: const Color.fromARGB(255, 0, 0, 0)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(60.0),
          borderSide:
              BorderSide(color: const Color.fromARGB(255, 0, 0, 0), width: 3.0),
        ),
      ),
      style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
      validator: (value) {
        if (value!.isEmpty || !value.contains('@')) {
          return 'Please enter a valid email';
        }
        return null;
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
        prefixIcon: Icon(Icons.lock, color: const Color.fromARGB(255, 0, 0, 0)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(60.0),
          borderSide:
              BorderSide(color: const Color.fromARGB(255, 0, 0, 0), width: 3.0),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty || value.length < 6) {
          return 'Password must be at least 6 characters long';
        }
        return null;
      },
    );
  }

  Widget _buildConfirmPasswordField() {
    return TextFormField(
      controller: _confirmPasswordController,
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Confirm Password',
        labelStyle: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
        prefixIcon:
            Icon(Icons.lock_outline, color: const Color.fromARGB(255, 0, 0, 0)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(60.0),
          borderSide:
              BorderSide(color: const Color.fromARGB(255, 0, 0, 0), width: 3.0),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty || value != _passwordController.text) {
          return 'Passwords do not match';
        }
        return null;
      },
    );
  }

  Future<void> _registerUser() async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        // You can now store additional user information in the Firebase database if needed
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  'Registration successful! Welcome, ${_nomController.text}!')),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Connexion()),
        );
      } on FirebaseAuthException catch (e) {
        var errorMessage = 'Failed to register. Please try again later.';
        if (e.code == 'weak-password') {
          errorMessage = 'The password provided is too weak.';
        } else if (e.code == 'email-already-in-use') {
          errorMessage = 'The account already exists for that email.';
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
      }
    }
  }
}
