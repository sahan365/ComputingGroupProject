import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application12/home_page.dart';

class LoginPage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _loginWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Display login success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login Successful'),
          backgroundColor: Colors.green,
        ),
      );

      // Navigate to home
      await Future.delayed(Duration(seconds: 1));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } catch (e) {
      // Show login error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login Error: Please check email and password'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String email = ''; // Define email variable
    String password = ''; // Define password variable

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/doctor.jpg.avif', //front page image path
              width: 350,
              height: 300,
            ),
            const Text('MyDoc'),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email Address',
              ),
              onChanged: (value) {
                email = value; // Update email variable
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
              onChanged: (value) {
                password = value; // Update password variable
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Call the login method when the button is pressed
                _loginWithEmailAndPassword(context, email, password);
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
