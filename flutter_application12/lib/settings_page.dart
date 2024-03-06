import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/blue12.jpg', // Add your cover image path
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                    height: 100), // Adjust height based on your cover image
                Text(
                  'Health Overview',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 10,
                    children: [
                      _buildHealthMetricCard(
                        icon: Icons.favorite,
                        title: 'Heart Rate',
                        value: '75 bpm',
                      ),
                      _buildHealthMetricCard(
                        icon: Icons.format_line_spacing,
                        title: 'Blood Pressure',
                        value: '120/80 mmHg',
                      ),
                      _buildHealthMetricCard(
                        icon: Icons.monitor_weight,
                        title: 'Weight',
                        value: '70 kg',
                      ),
                      _buildHealthMetricCard(
                        icon: Icons.accessibility_new,
                        title: 'Fitness Level',
                        value: 'Intermediate',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHealthMetricCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50,
              color: Colors.blue,
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
