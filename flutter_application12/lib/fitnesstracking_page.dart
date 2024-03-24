import 'dart:async';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application12/calendar_page.dart';
import 'package:flutter_application12/healthreminders_page.dart';
import 'package:flutter_application12/settings_page.dart';
import 'package:sensors/sensors.dart';


class FitnessTrackingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness Tracking',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FitnessTrackingPage(),
    );
  }
}

class FitnessTrackingPage extends StatefulWidget {
  @override
  _FitnessTrackingPageState createState() => _FitnessTrackingPageState();
}

class _FitnessTrackingPageState extends State<FitnessTrackingPage> {
  int stepsCount = 0;
  StreamSubscription? _accelerometerStream;

  @override
  void initState() {
    super.initState();
    _startListeningToAccelerometer();
  }

  @override
  void dispose() {
    _stopListeningToAccelerometer();
    super.dispose();
  }

  void _startListeningToAccelerometer() {
    _accelerometerStream =
        accelerometerEvents.listen((AccelerometerEvent event) {
      // Assuming steps are detected when the phone's accelerometer detects significant movement along the y-axis
      if (event.y > 5 && event.x > 5) {
        setState(() {
          stepsCount++;
        });
      }
    });
  }

  void _stopListeningToAccelerometer() {
    _accelerometerStream?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fitness Tracking'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Steps Count',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              '$stepsCount',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  stepsCount = 0;
                });
              },
              child: Text(
                'Reset',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        // Replace BottomAppBar with CurvedNavigationBar
        backgroundColor: Colors.white, // Change bottom app bar color
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
