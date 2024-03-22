import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_application12/admin/add_doctor.dart';
import 'package:flutter_application12/calendar_page.dart';
import 'package:flutter_application12/healthdatatracking_page.dart';
import 'package:flutter_application12/healthreminders_page.dart';
import 'package:flutter_application12/settings_page.dart';
import 'package:flutter_application12/userprofile_page.dart';

class AdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        titleTextStyle: const TextStyle(
          fontFamily: 'FontMain',
          color: Color.fromARGB(255, 199, 164, 106),
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        backgroundColor:
            Colors.white, // Change app bar background color
        
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Color.fromARGB(255, 179, 9, 9),
              size: 30,
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
      
      body: Stack(
        children: [
          
          SingleChildScrollView(
            child: Column(
              children: [
                // Horizontal List
                _buildHorizontalList(),
                const SizedBox(height: 1),
                // Greeting Message
                const Text(
                  'Hello there! Welcome to MyDoc...',
                  style: TextStyle(
                    fontFamily: 'FontMain',
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(255, 1, 25, 132),
                  ),
                ),
                const SizedBox(height: 10),
                // App categories
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: 
                  GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    children: [
                      _buildCategory(
                          'Add Doctor', Icons.add, Colors.blue,
                          () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    AddDoctor())); // Navigate to Dashboard Page
                      }),
                      _buildCategory(
                          'Health Data Tracking', Icons.timeline, Colors.green,
                          () {
                        // Navigate to Health Data Tracking Page
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    HealthDataTrackingPage()));
                      }),
                      _buildCategory('Health Reminders', Icons.notifications,
                          Colors.deepOrange, () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HealthRemindersPage()),
                        ); // Navigate to Health Reminders Page
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        // Replace BottomAppBar with CurvedNavigationBar
        backgroundColor:
            Colors.white, // Change bottom app bar color
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

  Widget _buildCategory(
      String title, IconData icon, Color color, void Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: GridTile(
        child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.white),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'FontMain',
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHorizontalList() {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 265,
      child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          enableInfiniteScroll: true,
          autoPlay: true,
        ),
        items: [
          'assets/images/ca3.jpg',
          'assets/images/diet.png',
          'assets/images/ca2.jpg',
          'assets/images/cover654.jpg',
        ].map((item) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(20), // Circular border radius
                ),
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(20), // Circular border radius
                  child: Image.asset(
                    item,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }

  Widget _buildListItem(String text) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: 100,
      color: Colors.blue,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

// Method to build the unread notification badge widget
Widget _buildUnreadNotificationBadge() {
  return Container(
    padding: const EdgeInsets.all(4),
    decoration: BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(8),
    ),
    child: const Text(
      '1',
      style: TextStyle(color: Colors.white),
    ),
  );
}
