import 'package:flutter/material.dart';
import 'package:flutter_application12/admin/login_page_admin.dart';
import 'package:flutter_application12/doctor/login_page_doctor.dart';
import 'login_page.dart';
import 'signup_page.dart';

class FrontPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MY DOC'),
        titleTextStyle: const TextStyle(
            fontFamily: 'FontMain',
            color: Color.fromARGB(255, 172, 29, 29),
            fontSize: 40,
            fontWeight: FontWeight.bold),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/doctor123.jpg', // logo
              width: 350,
              height: 350,
            ),
            const SizedBox(height: 10),
            
            DropdownExample(
            onItemSelected: (String? selectedItem) {
              // Handle the selected item here
              print("Login");
              // Add your commands for each option here
              if (selectedItem == 'Login as Admin') {
                // Command for Option 1
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPageAdmin()),
                );
              } else if (selectedItem == 'Login as Doctor') {
                // Command for Option 2
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPageDoctor()),
                );
              } else if (selectedItem == 'Login as Client') {
                // Command for Option 3
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              }
            },
          ),
            
            
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()),
                );
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

class DropdownExample extends StatelessWidget {
  final ValueSetter<String?>? onItemSelected;

  const DropdownExample({Key? key, this.onItemSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      onChanged: onItemSelected,
      items: <String>['Login as Admin', 'Login as Doctor', 'Login as Client']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
