import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application12/admin/todo.dart';
import 'package:flutter_application12/calendar_page.dart';
import 'package:flutter_application12/healthreminders_page.dart';
import 'package:flutter_application12/home_page.dart';
import 'package:flutter_application12/services/database_service.dart';
import 'package:flutter_application12/settings_page.dart';
import 'package:intl/intl.dart';

class AddDoctor extends StatefulWidget {
  @override
  _AddDoctorState createState() => _AddDoctorState();
}

class _AddDoctorState extends State<AddDoctor> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  bool isAvailable = false;

  final TextEditingController _textEditingController = TextEditingController();
  final DatabaseService _databaseService = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Doctor'),
        titleTextStyle: const TextStyle(
          fontFamily: 'FontMain',
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(
            255, 255, 255, 255), // Change app bar background color
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ));
              },
            );
          },
        ),
      ),
      body: _buildUI(),
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
  } //class

  Widget _buildUI() {
    return SafeArea(
        child: Column(
      children: [
        _messagesListView(),
      ],
    ));
  }

  Widget _messagesListView() {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.80,
      width: MediaQuery.sizeOf(context).width,
      child: StreamBuilder(
        stream: _databaseService.getDoctorLogs(), // Fetch doctor logs
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          List<DoctorLog> doctors = (snapshot.data ?? [])
              .cast<DoctorLog>(); // Cast the snapshot data to List<DoctorLog>
          if (doctors.isEmpty) {
            return Center(
              child: Text("No doctors available"),
            );
          }
          return ListView.builder(
            itemCount: doctors.length,
            itemBuilder: (context, index) {
              DoctorLog doctor = doctors[index];
              return ListTile(
                tileColor: Theme.of(context).colorScheme.primaryContainer,
                title: Text(doctor.name),
                subtitle: Text(doctor.category),
                trailing: Checkbox(
                  value: doctor.available,
                  onChanged: (value) async {
                    setState(() {
                      doctor.available = value ?? false;
                    });
                    try {
                      await _databaseService.updateDoctorAvailability(doctor);
                    } catch (e) {
                      print("Error updating doctor availability: $e");
                      // Handle error
                    }
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
