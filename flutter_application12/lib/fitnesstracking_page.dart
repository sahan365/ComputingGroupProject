import 'package:flutter/material.dart';

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
    );
  }
}
