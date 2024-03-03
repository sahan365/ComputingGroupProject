import 'package:flutter/material.dart';

class HealthDataTrackingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health Data Tracking'),
        titleTextStyle: const TextStyle(
            fontFamily: 'FontMain',
            color: Color.fromARGB(255, 172, 29, 29),
            fontSize: 20,
            fontWeight: FontWeight.bold),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Cover image
            Image.asset(
              'assets/images/tracking.png',
              fit: BoxFit.cover,
            ),
            // Form
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Physical Activity',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildFormField('Steps'),
                  _buildFormField('Distance'),
                  _buildFormField('Calories Burned'),
                  const SizedBox(height: 20),
                  const Text(
                    'Nutrition',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildFormField('Food Intake'),
                  _buildFormField('Calories'),
                  _buildFormField('Macronutrients'),
                  _buildFormField('Vitamins'),
                  const SizedBox(height: 20),
                  const Text(
                    'Sleep',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildFormField('Duration'),
                  _buildFormField('Quality'),
                  _buildFormField('Patterns'),
                  const SizedBox(height: 20),
                  const Text(
                    'Medication',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildFormField('Reminders'),
                  _buildFormField('Dosage'),
                  _buildFormField('Schedules'),
                  const SizedBox(height: 20),
                  const Text(
                    'Vital Signs',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildFormField('Heart Rate'),
                  _buildFormField('Blood Pressure'),
                  _buildFormField('Temperature'),
                  _buildFormField('Blood Sugar Levels'),
                  const SizedBox(height: 20),
                  const Text(
                    'Weight',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildFormField('Weight'),
                  _buildFormField('Body Composition'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Implement logic
                    },
                    child: const Text('Save'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormField(String labelText) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
      ),
    );
  }
}
