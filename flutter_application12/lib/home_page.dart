import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_application12/calendar_page.dart';
import 'package:flutter_application12/doctor_list.dart';
import 'package:flutter_application12/emergency_page.dart';
import 'package:flutter_application12/settings_page.dart';

import 'dietandnutrition_page.dart';
import 'fitnesstracking_page.dart';
import 'healthdatatracking_page.dart';
import 'healthreminders_page.dart';
import 'sleepmonitoring_page.dart';
import 'userprofile_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MY DOC'),
        titleTextStyle: const TextStyle(
          fontFamily: 'FontMain',
          color: Color.fromARGB(255, 199, 164, 106),
          fontSize: 38,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        backgroundColor:
            Color.fromARGB(255, 7, 21, 70), // Change app bar background color
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Color.fromARGB(255, 255, 255, 255),
                size: 35,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text('Categories'),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 4, 53, 93),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.dashboard,
                color: Colors.blue,
              ),
              title: Text('Dashboard'),
              onTap: () {
                // Navigate to Dashboard
              },
            ),
            ListTile(
              leading: Icon(
                Icons.timeline,
                color: Colors.green,
              ),
              title: Text('Health Data Tracking'),
              onTap: () {
                // Navigate to Health Data Tracking
              },
            ),
            ListTile(
              leading: Icon(
                Icons.notifications,
                color: Colors.orange,
              ),
              title: Row(
                children: [
                  Text('Health Reminders'),
                  SizedBox(width: 5),
                  _buildUnreadNotificationBadge(), // Unread notification badge
                ],
              ),
              onTap: () {
                // Navigate to Health Reminders
              },
            ),
            ListTile(
              leading: Icon(
                Icons.directions_run,
                color: Colors.deepPurple,
              ),
              title: Text('Fitness Tracking'),
              onTap: () {
                // Navigate to Fitness Tracking
              },
            ),
            ListTile(
              leading: Icon(
                Icons.local_dining,
                color: Colors.red,
              ),
              title: Text('Diet and Nutrition'),
              onTap: () {
                // Navigate to Diet and Nutrition
              },
            ),
            ListTile(
              leading: Icon(
                Icons.nights_stay,
                color: Colors.indigo,
              ),
              title: Text('Sleep Monitoring'),
              onTap: () {
                // Navigate to Sleep Monitoring
              },
            ),
            ListTile(
              leading: Icon(
                Icons.receipt,
                color: Colors.teal,
              ),
              title: Text('My Reports'),
              onTap: () {
                // Navigate to My Reports
              },
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.purple,
              ),
              title: Text('Doctor List'),
              onTap: () {
                // Navigate to Doctor List
              },
            ),
            ListTile(
              leading: Icon(
                Icons.local_hospital,
                color: Colors.deepOrange,
              ),
              title: Text('Emergency & Urgent Care'),
              onTap: () {
                // Navigate to Emergency & Urgent Care
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/blue12.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
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
                const SizedBox(height: 2),
                // App categories
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    children: [
                      _buildCategory('Dashboard', Icons.dashboard, Colors.blue,
                          () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    UserProfilePage())); // Navigate to Dashboard Page
                      }),
                      _buildCategory(
                          'Health Data Tracking', Icons.timeline, Colors.green,
                          () {
                        // Navigate to Health Data Tracking Page
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HealthDataTrackingPage()));
                      }),
                      _buildCategory('Health Reminders', Icons.notifications,
                          Colors.deepOrange, () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HealthRemindersPage()),
                        ); // Navigate to Health Reminders Page
                      }),
                      _buildCategory('Fitness Tracking', Icons.directions_run,
                          const Color.fromARGB(255, 150, 158, 58), () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FitnessTrackingPage()),
                        ); // Navigate to Fitness Tracking Page
                      }),
                      _buildCategory(
                          'Diet and Nutrition', Icons.local_dining, Colors.purple,
                          () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DietAndNutritionPage()),
                        ); // Navigate to Diet and Nutrition Page
                      }),
                      _buildCategory('Sleep Monitoring', Icons.nights_stay,
                          const Color.fromARGB(255, 50, 55, 55), () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SleepMonitoringPage(),
                          ),
                        ); // Navigate to Sleep Monitoring Page
                      }),
                      _buildCategory('My Reports', Icons.receipt, Colors.indigo,
                          () {
                        // Navigate to Sleep Monitoring Page
                      }),
                      _buildCategory('Doctor List', Icons.person,
                          const Color.fromARGB(255, 215, 163, 8), () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DoctorList(),
                          ),
                        );
                      }),
                      _buildCategory(
                          'Emergency', Icons.local_hospital, Colors.red, () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => emergencyPage(),
                          ),
                        ); // Navigate to Emergency Page
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
