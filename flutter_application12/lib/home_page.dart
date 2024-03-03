import 'package:flutter/material.dart';
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
          color: Color.fromARGB(255, 23, 15, 130),
          fontSize: 36,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(
            255, 196, 201, 205), // Change app bar background color
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserProfilePage()),
              ); // Navigate to user profile page
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
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
            const DrawerHeader(
              child: Text('Categories'),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 196, 201, 205),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              onTap: () {
                // Navigate to Dashboard
              },
            ),
            ListTile(
              leading: const Icon(Icons.timeline),
              title: const Text('Health Data Tracking'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HealthDataTrackingPage()),
                ); // Navigate to Health Data Tracking
              },
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: Row(
                children: [
                  const Text('Health Reminders'),
                  const SizedBox(width: 5),
                  _buildUnreadNotificationBadge(), // Unread notification badge
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HealthRemindersPage()),
                ); // Navigate to Health Reminders
              },
            ),
            ListTile(
              leading: const Icon(Icons.directions_run),
              title: const Text('Fitness Tracking'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FitnessTrackingPage()),
                ); // Navigate to Fitness Tracking
              },
            ),
            ListTile(
              leading: const Icon(Icons.local_dining),
              title: const Text('Diet and Nutrition'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DietAndNutritionPage()),
                ); // Navigate to Diet and Nutrition
              },
            ),
            ListTile(
              leading: const Icon(Icons.nights_stay),
              title: const Text('Sleep Monitoring'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SleepMonitoringPage(),
                  ),
                ); // Navigate to Sleep Monitoring
              },
            ),
            ListTile(
              leading: const Icon(Icons.receipt),
              title: const Text('My Reports'),
              onTap: () {
                // Navigate to My Reports
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Doctor List'),
              onTap: () {
                // Navigate to Doctor List
              },
            ),
            ListTile(
              leading: const Icon(Icons.local_hospital),
              title: const Text('Emergency & Urgent Care'),
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
                image: AssetImage('assets/images/456.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              // Cover image
              Image.asset('assets/images/new.jpg'),
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
                      // Navigate to Dashboard Page
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
                      // Navigate to Sleep Monitoring Page
                    }),
                    _buildCategory('Emergency & Urgent Care',
                        Icons.local_hospital, Colors.red, () {
                      // Navigate to Sleep Monitoring Page
                    }),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color:
            Color.fromARGB(255, 196, 201, 205), // Change bottom app bar color
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                // Navigate to Home Page
              },
            ),
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                // Navigate to Notifications Page
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                // Navigate to Settings Page
              },
            ),
          ],
        ),
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
            borderRadius: BorderRadius.circular(15),
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
                  fontSize: 14,
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
