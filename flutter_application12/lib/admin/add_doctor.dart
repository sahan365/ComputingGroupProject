import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class AddDoctor extends StatefulWidget {
  const AddDoctor({super.key});

  @override
  State<AddDoctor> createState() => _AddDoctorState();
}

class _AddDoctorState extends State<AddDoctor> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  bool isAvailable = false;

  addDoctor(
      String name, String phone, String category, bool Availability) async {
    if (name == "" || phone == "") {
      
    } else {
      FirebaseFirestore.instance
          .collection("Doctor")
          .doc(AddDoctor as String?)
          .set({
        "name": name,
        "phone": phone,
        "category": category,
        "availability": Availability,
      }).then((value) {
         ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('data inserted succesfully!'),
          backgroundColor: Colors.green,
        ),
      );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Doctor'),
        titleTextStyle: const TextStyle(
          fontFamily: 'FontMain',
          color: Color.fromARGB(255, 199, 164, 106),
          fontSize: 38,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(
            255, 255, 255, 255), // Change app bar background color
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
                size: 35,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Color.fromARGB(255, 179, 9, 9),
              size: 30,
            ),
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
            DrawerHeader(
              child: Text('Categories'),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 4, 53, 93),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.dashboard,
                color: Colors.blue,
              ),
              title: Text('Dashboard'),
              onTap: () {
                // Navigate to Dashboard
              },
            ),
            ListTile(
              leading: Icon(
                Icons.timeline,
                color: Colors.green,
              ),
              title: Text('Health Data Tracking'),
              onTap: () {
                // Navigate to Health Data Tracking
              },
            ),
            ListTile(
              leading: Icon(
                Icons.notifications,
                color: Colors.orange,
              ),
              title: Row(
                children: [
                  Text('Health Reminders'),
                  SizedBox(width: 5),
                  // Unread notification badge
                ],
              ),
              onTap: () {
                // Navigate to Health Reminders
              },
            ),
            ListTile(
              leading: Icon(
                Icons.directions_run,
                color: Colors.deepPurple,
              ),
              title: Text('Fitness Tracking'),
              onTap: () {
                // Navigate to Fitness Tracking
              },
            ),
            ListTile(
              leading: Icon(
                Icons.local_dining,
                color: Colors.red,
              ),
              title: Text('Diet and Nutrition'),
              onTap: () {
                // Navigate to Diet and Nutrition
              },
            ),
            ListTile(
              leading: Icon(
                Icons.nights_stay,
                color: Colors.indigo,
              ),
              title: Text('Sleep Monitoring'),
              onTap: () {
                // Navigate to Sleep Monitoring
              },
            ),
            ListTile(
              leading: Icon(
                Icons.receipt,
                color: Colors.teal,
              ),
              title: Text('My Reports'),
              onTap: () {
                // Navigate to My Reports
              },
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.purple,
              ),
              title: Text('Doctor List'),
              onTap: () {
                // Navigate to Doctor List
              },
            ),
            ListTile(
              leading: Icon(
                Icons.local_hospital,
                color: Colors.deepOrange,
              ),
              title: Text('Emergency & Urgent Care'),
              onTap: () {
                // Navigate to Emergency & Urgent Care
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(labelText: 'Phone Number'),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: categoryController,
              decoration: InputDecoration(labelText: 'Category'),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Text('Availability'),
                Switch(
                  value: isAvailable,
                  onChanged: (value) {
                    setState(() {
                      isAvailable = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                addDoctor(nameController.text.toString(), phoneNumberController.text.toString(), categoryController.text.toString(),isAvailable);
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        // Replace BottomAppBar with CurvedNavigationBar
        backgroundColor: Colors.white, // Change bottom app bar color
        color: Colors.blue, // Change the background color of the bar items
        buttonBackgroundColor: const Color.fromARGB(
            251, 157, 172, 185), // Change the background color of the buttons
        height: 60, // Adjust the height of the bar
        items: const <Widget>[
          Icon(Icons.notifications, size: 30),
          Icon(Icons.event, size: 30),
          Icon(Icons.settings, size: 30),
        ],
        onTap: (index) {},
      ),
    );
  }
}
