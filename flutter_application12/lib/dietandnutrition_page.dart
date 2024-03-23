import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application12/calendar_page.dart';
import 'package:flutter_application12/healthreminders_page.dart';
import 'package:flutter_application12/home_page.dart';
import 'package:flutter_application12/settings_page.dart';

void main() {
  runApp(DietNutritionApp());
}

class DietNutritionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diet & Nutrition',
      home: DietNutritionPage(),
    );
  }
}

class DietNutritionPage extends StatefulWidget {
  @override
  _DietNutritionPageState createState() => _DietNutritionPageState();
}

class _DietNutritionPageState extends State<DietNutritionPage> {
  List<Meal> meals = [
    Meal(name: 'Breakfast', calories: 300),
    Meal(name: 'Lunch', calories: 500),
    Meal(name: 'Dinner', calories: 700),
  ];

  int totalCalories() {
    return meals.fold(0, (total, meal) => total + meal.calories);
  }

  void addMeal(String name, int calories) {
    setState(() {
      meals.add(Meal(name: name, calories: calories));
    });
  }

  void deleteMeal(int index) {
    setState(() {
      meals.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black, size: 30),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
        title: Text(
          'Diet & Nutrition',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Total Calories: ${totalCalories()}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: meals.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    title: Text(
                      meals[index].name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    subtitle: Text(
                      '${meals[index].calories} calories',
                      style: TextStyle(
                          fontStyle: FontStyle.italic, color: Colors.grey[700]),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => deleteMeal(index),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddMealDialog(context);
        },
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: Icon(Icons.add, color: Colors.white),
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
  }

  Future<void> _showAddMealDialog(BuildContext context) async {
    TextEditingController nameController = TextEditingController();
    TextEditingController caloriesController = TextEditingController();

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Add Meal',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Meal Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: caloriesController,
                decoration: InputDecoration(
                  labelText: 'Calories',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style:
                    TextStyle(color: Theme.of(context).colorScheme.secondary),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty &&
                    caloriesController.text.isNotEmpty) {
                  addMeal(
                      nameController.text, int.parse(caloriesController.text));
                  Navigator.of(context).pop();
                }
              },
              style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).colorScheme.secondary),
              child: Text(
                'Add',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }
}

class Meal {
  final String name;
  final int calories;

  Meal({
    required this.name,
    required this.calories,
  });
}
