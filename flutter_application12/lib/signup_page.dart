import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application12/login_page.dart';

class SignUpPage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _registerWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Registration successful, navigate to the next page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } catch (e) {
      // Registration failed, show error message
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Registration failed: $e'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    String email = ''; // Define email variable
    String password = ''; // Define password variable

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        titleTextStyle: const TextStyle(
            fontFamily: 'FontMain',
            color: Color.fromARGB(255, 172, 29, 29),
            fontSize: 40,
            fontWeight: FontWeight.bold),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/ca3.jpg', //front page image path
              width: 350,
              height: 250,
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
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
              onChanged: (value) {
                password = value; // Update password variable
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Birthday',
              ),
              keyboardType: TextInputType.datetime,
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Phone Number',
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Call the register method when the button is pressed
                _registerWithEmailAndPassword(context, email, password);
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
