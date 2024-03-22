import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application12/admin/connection.dart';
import 'package:flutter_application12/calendar_page.dart';
import 'package:flutter_application12/healthreminders_page.dart';
import 'package:flutter_application12/home_page.dart';
import 'package:flutter_application12/services/database_service.dart';
import 'package:flutter_application12/settings_page.dart';
import 'package:url_launcher/url_launcher.dart';

class DoctorList extends StatefulWidget {
  @override
  _DoctorListState createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  bool isAvailable = false;

  final DatabaseService _databaseService = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctor List'),
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
        child: SingleChildScrollView(
          child: Column(
                children: [
          _messagesListView(),
                ],
              ),
        ));
  }

  Widget _messagesListView() {
  return SizedBox(
    height: MediaQuery.sizeOf(context).height * 0.80,
    width: MediaQuery.sizeOf(context).width,
    child: StreamBuilder(
      stream: _databaseService.getDoctorLogs1(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        List doctors = snapshot.data?.docs ?? [];
        return ListView.builder(
          itemCount: doctors.length,
          itemBuilder: (context, index) {
            DoctorLog doctor = doctors[index].data();
            if (doctor.available != true) {
              return SizedBox.shrink(); // Hide the ListTile if doctor is not available
            }
            return Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              child: ListTile(
                tileColor: Theme.of(context).colorScheme.primaryContainer,
                title: Text(doctor.name),
                subtitle: Text(
                  doctor.category,
                ),
                trailing: ElevatedButton(
                  onPressed: () {
                    _makePhoneCall(doctor.phone);
                  },
                  child: Text("Call Doctor"),
                ),
              ),
            );
          },
        );
      },
    ),
  );
}


  void _makePhoneCall(String number) async {
    String telScheme = 'tel:$number';
    if (await canLaunch(telScheme)) {
      await launch(telScheme);
    } else {
      throw 'Could not launch $telScheme';
    }
  }

  
}
