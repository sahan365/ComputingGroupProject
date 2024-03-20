import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application12/calendar_page.dart';
import 'package:flutter_application12/settings_page.dart';

class HealthRemindersPage extends StatelessWidget {
  const HealthRemindersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health Reminders'),
        titleTextStyle: const TextStyle(
          fontFamily: 'FontMain',
          color: Color.fromARGB(255, 172, 29, 29),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Cover Image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/cover32.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Content
          Positioned(
            top: 200,
            left: 10,
            right: 10,
            bottom: 0,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCategory(
                      'Medication Reminders',
                      Icons.medication,
                      unread: true,
                    ),
                    _buildReminderItem(
                      'Take pills',
                      Icons.medication,
                      unread: true,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TakePillsPage()),
                        );
                      },
                    ),
                    _buildReminderItem(
                      'Refill prescription',
                      Icons.add_shopping_cart,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RefillPrescriptionPage()),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    _buildCategory('Exercise Reminders', Icons.directions_run),
                    _buildReminderItem(
                      'Go for a run',
                      Icons.directions_run,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const GoForRunPage()),
                        );
                      },
                    ),
                    _buildReminderItem(
                      'Attend gym session',
                      Icons.fitness_center,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GymSessionPage()),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    _buildCategory(
                      'Appointment Reminders',
                      Icons.local_hospital,
                    ),
                    _buildReminderItem(
                      'Doctor appointment',
                      Icons.local_hospital,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DoctorAppointmentPage),
                        );
                      },
                    ),
                    _buildReminderItem(
                      'Dentist appointment',
                      Icons.local_hospital,
                      unread: true,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DentistAppointmentPage),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    _buildCategory('Healthy Habits', Icons.local_drink),
                    _buildReminderItem(
                      'Drink water',
                      Icons.local_drink,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DrinkWaterPage),
                        );
                      },
                    ),
                    _buildReminderItem(
                      'Take a stretch break',
                      Icons.accessibility,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StretchBreakPage),
                        );
                      },
                    ),
                  ],
                ),
              ),
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
    String title,
    IconData icon, {
    bool unread = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: Row(
        children: [
          Icon(icon, size: 24, color: Colors.blue),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          if (unread) const SizedBox(width: 10),
          if (unread)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'Unread',
                style: TextStyle(color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildReminderItem(
    String title,
    IconData icon, {
    bool unread = false,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: unread ? Colors.red : Colors.blue),
      title: Text(
        title,
        style: TextStyle(color: unread ? Colors.red : Colors.black),
      ),
      onTap: onTap,
    );
  }

  get DoctorAppointmentPage {}

  get DentistAppointmentPage {}

  get DrinkWaterPage {}

  get StretchBreakPage {}
}

GymSessionPage() {}

// Example pages for each reminder
class TakePillsPage extends StatelessWidget {
  const TakePillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Take Pills Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Take Pills Content',
              style: TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to the page for adding medicine
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddMedicinePage()),
                );
              },
              child: const Text('Add Medicine'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to the page for setting reminder timer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ReminderTimerPage()),
                );
              },
              child: const Text('Set Reminder Timer'),
            ),
          ],
        ),
      ),
    );
  }
}

class AddMedicinePage extends StatelessWidget {
  const AddMedicinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Medicine'),
      ),
      body: const Center(
        child: Text('Add Medicine Content'),
      ),
    );
  }
}

class ReminderTimerPage extends StatelessWidget {
  const ReminderTimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set Reminder Timer'),
      ),
      body: const Center(
        child: Text('Set Reminder Timer Content'),
      ),
    );
  }
}

class RefillPrescriptionPage extends StatelessWidget {
  const RefillPrescriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Refill Prescription Page'),
      ),
      body: const Center(
        child: Text('Refill Prescription Content'),
      ),
    );
  }
}

class GoForRunPage extends StatelessWidget {
  const GoForRunPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Go for a Run Page'),
      ),
      body: const Center(
        child: Text('Go for a Run Content'),
      ),
    );
  }
}

class AttendGymSessionPage extends StatelessWidget {
  const AttendGymSessionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attend gym session Page'),
      ),
      body: const Center(
        child: Text('Attend gym session Page'),
      ),
    );
  }

// Implement other pages in a similar manner
}