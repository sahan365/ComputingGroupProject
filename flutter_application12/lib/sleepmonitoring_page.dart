import 'package:flutter/material.dart';

class SleepMonitoringPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sleep Monitoring'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Cover image
            Container(
              height: 300, // Adjust the height
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/sleep.jpg'), //image path
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 100),
            // Categories grid view
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(10),
              children: [
                _buildCategoryTile(
                    'Sleep Patterns', Icons.access_time, Colors.blue),
                _buildCategoryTile(
                    'Assess Quality', Icons.assessment, Colors.green),
                _buildCategoryTile(
                    'Track Duration', Icons.timer, Colors.orange),
                _buildCategoryTile(
                    'Maintain Consistency', Icons.timeline, Colors.purple),
                _buildCategoryTile(
                    'Identify Disorders', Icons.warning, Colors.red),
                _buildCategoryTile('Manage Stress', Icons.sentiment_satisfied,
                    Color.fromARGB(255, 17, 13, 248)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryTile(String title, IconData icon, Color color) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () {
          // Handle category tap
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 50, color: color),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'FontMain',
                  color: Color.fromARGB(255, 18, 17, 17),
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
