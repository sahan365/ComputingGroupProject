import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application12/HealthReportPage.dart';
import 'package:flutter_application12/calendar_page.dart';
import 'package:flutter_application12/healthreminders_page.dart';
import 'package:flutter_application12/settings_page.dart';

class HealthDataTrackingPage extends StatefulWidget {
  const HealthDataTrackingPage({super.key});

  @override
  _HealthDataTrackingPageState createState() => _HealthDataTrackingPageState();
}

class _HealthDataTrackingPageState extends State<HealthDataTrackingPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Variables to store form field values
  String steps = '';
  String distance = '';
  String caloriesBurned = '';
  String foodIntake = '';
  String calories = '';
  String macronutrients = '';
  String vitamins = '';
  String sleepDuration = '';
  String sleepQuality = '';
  String sleepPatterns = '';
  String medicationReminders = '';
  String medicationDosage = '';
  String medicationSchedules = '';
  String heartRate = '';
  String bloodPressure = '';
  String temperature = '';
  String bloodSugarLevels = '';
  String weight = '';
  String bodyComposition = '';

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
        child: Form(
          key: _formKey,
          child: Padding(
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
                _buildFormField('Steps', (value) => steps = value),
                _buildFormField('Distance', (value) => distance = value),
                _buildFormField(
                    'Calories Burned', (value) => caloriesBurned = value),
                const SizedBox(height: 20),
                const Text(
                  'Nutrition',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                _buildFormField('Food Intake', (value) => foodIntake = value),
                _buildFormField('Calories', (value) => calories = value),
                _buildFormField(
                    'Macronutrients', (value) => macronutrients = value),
                _buildFormField('Vitamins', (value) => vitamins = value),
                const SizedBox(height: 20),
                const Text(
                  'Sleep',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                _buildFormField('Duration', (value) => sleepDuration = value),
                _buildFormField('Quality', (value) => sleepQuality = value),
                _buildFormField('Patterns', (value) => sleepPatterns = value),
                const SizedBox(height: 20),
                const Text(
                  'Medication',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                _buildFormField(
                    'Reminders', (value) => medicationReminders = value),
                _buildFormField('Dosage', (value) => medicationDosage = value),
                _buildFormField(
                    'Schedules', (value) => medicationSchedules = value),
                const SizedBox(height: 20),
                const Text(
                  'Vital Signs',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                _buildFormField('Heart Rate', (value) => heartRate = value),
                _buildFormField(
                    'Blood Pressure', (value) => bloodPressure = value),
                _buildFormField('Temperature', (value) => temperature = value),
                _buildFormField(
                    'Blood Sugar Levels', (value) => bloodSugarLevels = value),
                const SizedBox(height: 20),
                const Text(
                  'Weight',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                _buildFormField('Weight', (value) => weight = value),
                _buildFormField(
                    'Body Composition', (value) => bodyComposition = value),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Save form data
                    _saveData();
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        ),
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

  Widget _buildFormField(String labelText, Function(String) onSaved) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      onSaved: (value) {
        // Implement your saving logic here using the 'value'
      },
    );
  }

  void _saveData() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Create a map to store the health data
      var healthData = {
        'Steps': steps,
        'Distance': distance,
        'Calories Burned': caloriesBurned,
        'Food Intake': foodIntake,
        'Calories': calories,
        'Macronutrients': macronutrients,
        'Vitamins': vitamins,
        'Sleep Duration': sleepDuration,
        'Medication Dosage': medicationDosage,
        'Medication Schedules': medicationSchedules,
        'Heart Rate': heartRate,
        'Blood Pressure': bloodPressure,
        'Temperature': temperature,
        'Blood Sugar Levels': bloodSugarLevels,
        'Weight': weight,
        'Body Composition': bodyComposition,
      };

      // Navigate to the report page and pass the health data
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HealthReportPage(healthData: healthData),
        ),
      );
    }
  }
  // Implement logic to save the form data
  // Here you can use the variables (steps, distance, etc.) to access the form field values
  // For example:
  // print('Steps: $steps');
  // print('Distance: $distance');
  // print('Calories Burned: $caloriesBurned');
  // and so on...
}