import 'package:flutter/material.dart';

class HealthRemindersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health Reminders'),
        titleTextStyle: const TextStyle(
            fontFamily: 'FontMain',
            color: Color.fromARGB(255, 172, 29, 29),
            fontSize: 20,
            fontWeight: FontWeight.bold),
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
                  image: AssetImage('assets/cover32.jpg.avif'),
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
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCategory('Medication Reminders', Icons.medication,
                      unread: true),
                  _buildReminderItem('Take pills', Icons.medication,
                      unread: true),
                  _buildReminderItem(
                      'Refill prescription', Icons.add_shopping_cart),
                  const SizedBox(height: 10),
                  _buildCategory('Exercise Reminders', Icons.directions_run),
                  _buildReminderItem('Go for a run', Icons.directions_run),
                  _buildReminderItem(
                      'Attend gym session', Icons.fitness_center),
                  const SizedBox(height: 10),
                  _buildCategory('Appointment Reminders', Icons.local_hospital),
                  _buildReminderItem(
                      'Doctor appointment', Icons.local_hospital),
                  _buildReminderItem(
                      'Dentist appointment', Icons.local_hospital,
                      unread: true),
                  const SizedBox(height: 10),
                  _buildCategory('Healthy Habits', Icons.local_drink),
                  _buildReminderItem('Drink water', Icons.local_drink),
                  _buildReminderItem(
                      'Take a stretch break', Icons.accessibility),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategory(String title, IconData icon, {bool unread = false}) {
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

  Widget _buildReminderItem(String title, IconData icon,
      {bool unread = false}) {
    return ListTile(
      leading: Icon(icon, color: unread ? Colors.red : Colors.blue),
      title: Text(
        title,
        style: TextStyle(color: unread ? Colors.red : Colors.black),
      ),
      onTap: () {
        // Implement reminder functionality
      },
    );
  }
}
