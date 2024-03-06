import 'package:flutter/material.dart';

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _contactDetailsController =
      TextEditingController();
  final TextEditingController _healthGoalsController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _specialNotesController = TextEditingController();

  void _saveProfile() {
    String name = _nameController.text;
    int age = int.tryParse(_ageController.text) ?? 0;
    String gender = _genderController.text;
    String contactDetails = _contactDetailsController.text;
    String healthGoals = _healthGoalsController.text;
    String weight = _weightController.text;
    String height = _heightController.text;
    String specialNotes = _specialNotesController.text;

    // Save or update user profile with the entered details
    // You can implement your logic here to save/update the user profile
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/Man.jpg.avif'),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _ageController,
                decoration: const InputDecoration(
                  labelText: 'Age',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _genderController,
                decoration: const InputDecoration(
                  labelText: 'Gender',
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _contactDetailsController,
                decoration: const InputDecoration(
                  labelText: 'Contact Details',
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _healthGoalsController,
                decoration: const InputDecoration(
                  labelText: 'Health Goals',
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _weightController,
                decoration: const InputDecoration(
                  labelText: 'Weight',
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _heightController,
                decoration: const InputDecoration(
                  labelText: 'Height',
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _specialNotesController,
                decoration: const InputDecoration(
                  labelText: 'Special Notes',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveProfile,
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose the controllers when the widget is disposed
    _nameController.dispose();
    _ageController.dispose();
    _genderController.dispose();
    _contactDetailsController.dispose();
    _healthGoalsController.dispose();
    _weightController.dispose();
    _heightController.dispose();
    _specialNotesController.dispose();
    super.dispose();
  }
}
