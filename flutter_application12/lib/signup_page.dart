import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/doctor.jpg.avif', //front page image path
              width: 250,
              height: 250,
            ),
            const Text('MyDoc'),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email Address',
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
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
                // Implement sign up functionality
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                // Navigate to Home
              },
            ),
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                // Navigate to notifications page
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                // Navigate to settings page
              },
            ),
          ],
        ),
      ),
    );
  }
}
