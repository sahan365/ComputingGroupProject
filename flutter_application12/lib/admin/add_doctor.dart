import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application12/admin/admindashboard.dart';
import 'package:flutter_application12/admin/connection.dart';
import 'package:flutter_application12/calendar_page.dart';
import 'package:flutter_application12/healthreminders_page.dart';
import 'package:flutter_application12/services/database_service.dart';
import 'package:flutter_application12/settings_page.dart';

class AddDoctor extends StatefulWidget {
  @override
  _AddDoctorState createState() => _AddDoctorState();
}

class _AddDoctorState extends State<AddDoctor> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  bool isAvailable = false;

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
                      builder: (context) => AdminDashboard(),
                    ));
              },
            );
          },
        ),
      ),
      body: _buildUI(),
      floatingActionButton: FloatingActionButton(
        onPressed: _displayTextInputDialog,
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(
          Icons.add,
          color: Colors.white,
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
        stream: _databaseService
            .getDoctorLogs1(), // Fetch doctor logs instead of todos
        builder: (context, snapshot) {
          List doctors = snapshot.data?.docs ?? [];
          if (doctors.isEmpty) {
            return Center(
              child: Text("No doctors available!"),
            );
          }
          return ListView.builder(
            itemCount: doctors.length,
            itemBuilder: (context, index) {
              DoctorLog doctor = doctors[index].data();
              String doctorId = doctors[index].id;
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
                  trailing: Checkbox(
                    value: doctor.available,
                    onChanged: (value) {
                      DoctorLog updatedDoctor = doctor.copyWith(
                        available: value!,
                      );
                      _databaseService.updateDoctor(doctorId, updatedDoctor);
                    },
                  ),
                  onLongPress: () {
                      _databaseService.deleteDoctor(doctorId);
                    },
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _displayTextInputDialog() async {
    TextEditingController nameController = TextEditingController();
    TextEditingController categoryController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController phoneController = TextEditingController();

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Add a Doctor"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(hintText: "Doctor's Name"),
              ),
              SizedBox(height: 10),
              TextField(
                controller: categoryController,
                decoration: InputDecoration(hintText: "Category"),
              ),
              SizedBox(height: 10),
              TextField(
                controller: emailController,
                decoration: InputDecoration(hintText: "email"),
              ),
              SizedBox(height: 10),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(hintText: "Password"),
              ),
              SizedBox(height: 10),
              TextField(
                controller: phoneController,
                decoration: InputDecoration(hintText: "Phone number"),
              ),
            ],
          ),
          actions: <Widget>[
            MaterialButton(
              onPressed: () {
                if (nameController.text.isEmpty ||
                    emailController.text.isEmpty ||
                    categoryController.text.isEmpty ||
                    passwordController.text.isEmpty || phoneController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('fill all fields!'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }else{
                  DoctorLog doctor = DoctorLog(
                  name: nameController.text,
                  category: categoryController.text,
                  available: false,
                  email: emailController.text,
                  password: passwordController.text,
                  phone: phoneController.text,
                  // Assuming other fields like email, password, and availability are set elsewhere
                );
                _databaseService.AddDoctor(doctor);
                Navigator.pop(context);
                nameController.clear();
                categoryController.clear();
                emailController.clear();
                passwordController.clear();
                phoneController.clear();
                }
                
              },
              color: Theme.of(context).colorScheme.primary,
              textColor: Colors.white,
              child: Text("Ok"),
            ),
          ],
        );
      },
    );
  }
}
