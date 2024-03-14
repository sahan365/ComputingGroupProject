import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application12/calendar_page.dart';
import 'package:flutter_application12/healthreminders_page.dart';
import 'package:flutter_application12/settings_page.dart';

class DietAndNutritionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diet and Nutrition'),
        titleTextStyle: const TextStyle(
            fontFamily: 'FontMain',
            color: Color.fromARGB(255, 172, 29, 29),
            fontSize: 20,
            fontWeight: FontWeight.bold),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cover image
            Container(
              height: 300, // Adjust height
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/diet.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Diet and Nutrition content
                  Text(
                    'Food Diary',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.book, color: Colors.blue),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Log your meals and track your dietary intake with a food diary.',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Barcode Scanner',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.qr_code_scanner, color: Colors.green),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Use a barcode scanner to get nutritional information by scanning food products.',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Meal Plans and Recipes',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.restaurant_menu, color: Colors.orange),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Receive personalized meal plans and discover recipes tailored to your dietary preferences.',
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
      bottomNavigationBar: CurvedNavigationBar(
        // Replace BottomAppBar with CurvedNavigationBar
        backgroundColor:
            Color.fromARGB(255, 207, 190, 210), // Change bottom app bar color
        color: Colors.blue, // Change the background color of the bar items
        buttonBackgroundColor: const Color.fromARGB(
            251, 157, 172, 185), // Change the background color of the buttons
        height: 60, // Adjust the height of the bar
        items: const <Widget>[
          Icon(Icons.notifications, size: 30),
          Icon(Icons.event, size: 30),
          Icon(Icons.settings, size: 30),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HealthRemindersPage()),
            ); // Navigate to Notifications Page
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CalendarPage()),
            ); // Navigate to Calender Page
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsPage()),
            ); // Navigate to Settings Page
          }
        },
      ),
    );
  }
}
