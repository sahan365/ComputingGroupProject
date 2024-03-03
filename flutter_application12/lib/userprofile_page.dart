import 'package:flutter/material.dart';

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  String? name;
  int? age;
  String? gender;
  String? contactDetails;
  String? healthGoals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
        titleTextStyle: const TextStyle(
            fontFamily: 'FontMain',
            color: Color.fromARGB(255, 172, 29, 29),
            fontSize: 20,
            fontWeight: FontWeight.bold),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                  'assets/images/Man.jpg.avif'), //User's profile image
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Age',
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  age = int.tryParse(value);
                });
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Gender',
              ),
              onChanged: (value) {
                setState(() {
                  gender = value;
                });
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Contact Details',
              ),
              onChanged: (value) {
                setState(() {
                  contactDetails = value;
                });
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Health Goals',
              ),
              onChanged: (value) {
                setState(() {
                  healthGoals = value;
                });
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Weight',
              ),
              onChanged: (value) {
                setState(() {
                  contactDetails = value;
                });
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Height',
              ),
              onChanged: (value) {
                setState(() {
                  contactDetails = value;
                });
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Special Notes',
              ),
              onChanged: (value) {
                setState(() {
                  contactDetails = value;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save user profile information
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
