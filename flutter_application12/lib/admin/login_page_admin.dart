import 'package:flutter/material.dart';
import 'package:flutter_application12/admin/admindashboard.dart';
import 'package:flutter_application12/admin/connection.dart';
import 'package:flutter_application12/services/database_service.dart';

class LoginPageAdmin extends StatelessWidget {
  final DatabaseService _databaseService = DatabaseService();


  Future<void> _loginWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    try {

      // Fetch doctor logs from Firestore
      List<AdminLog> adminLogs = await _databaseService.fetchAdminLogs();

      // Check if entered email and password match any doctor's credentials
      bool isCredentialsValid = adminLogs.any((log) =>
          log.email == email && log.password == password);

      if (isCredentialsValid) {
        // Display login success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login Successful'),
            backgroundColor: Colors.green,
          ),
        );

        // Navigate to home
        await Future.delayed(const Duration(seconds: 1));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AdminDashboard()),
        );
      } else {
        // Show login error message if credentials don't match
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Invalid Email or Password'),
            backgroundColor: Colors.red,
          ),
        );
      }
      
    } catch (e) {
      // Show login error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
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
        title: const Text('Admin Login'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/doctor123.jpg', //front page image path
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
      ),
    );
  }
}
