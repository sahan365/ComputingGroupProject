import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application12/calendar_page.dart';
import 'package:flutter_application12/healthreminders_page.dart';
import 'package:flutter_application12/settings_page.dart';

class FitnessTrackingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fitness Tracking'),
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
                  image: AssetImage('assets/images/fitness.jpg.avif'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Fitness tracking content
                  const Text(
                    'GPS Tracking for Outdoor Activities',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.blue),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: Text(
                          'Track your outdoor activities like running, cycling, and walking with GPS to monitor distance, route, and pace.',
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Placeholder onPressed function for creating workout plan
                        },
                        child: const Text('Track'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Workout Plans and Routines',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.fitness_center, color: Colors.green),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: Text(
                          'Access a variety of workout plans and routines tailored to different fitness levels and goals.',
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Placeholder onPressed function for viewing current plan
                        },
                        child: const Text('Create or Current Plan'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Fitness Progress Monitoring and Goal Setting',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.trending_up, color: Colors.orange),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: Text(
                          'Track your fitness progress over time, set goals, and receive insights to improve your performance.',
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Placeholder onPressed function for viewing progress
                        },
                        child: const Text('View'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange,
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
