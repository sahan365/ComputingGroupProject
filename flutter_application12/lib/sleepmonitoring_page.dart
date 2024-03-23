import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SleepMonitoringPage extends StatefulWidget {
  @override
  _SleepMonitoringPageState createState() => _SleepMonitoringPageState();
}

class _SleepMonitoringPageState extends State<SleepMonitoringPage> {
  List<SleepEntry> sleepEntries = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Load sleep entries for the logged-in user when the page starts
    loadSleepEntries();
  }

  @override
  void initState() {
    super.initState();
    // Load sleep entries for the logged-in user when the page starts
    loadSleepEntries();
  }

  // Function to load sleep entries from shared preferences
  Future<void> loadSleepEntries() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? entries = prefs.getStringList('sleep_entries');
    if (entries != null) {
      setState(() {
        sleepEntries =
            entries.map((entry) => SleepEntry.fromString(entry)).toList();
      });
    }
  }

  // Function to save sleep entries to shared preferences
  Future<void> saveSleepEntries() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> entries =
        sleepEntries.map((entry) => entry.toString()).toList();
    await prefs.setStringList('sleep_entries', entries);
  }

  // Function to add a sleep entry with the current time as start time
  void addSleepEntry() {
    DateTime startTime = DateTime.now();
    setState(() {
      sleepEntries.add(SleepEntry(startTime, null));
      saveSleepEntries(); // Save sleep entries after adding a new entry
    });
  }

  // Function to delete a sleep entry
  void deleteSleepEntry(int index) {
    setState(() {
      sleepEntries.removeAt(index);
      saveSleepEntries(); // Save sleep entries after deleting an entry
    });
  }

  // Function to end sleep time
  void endSleepTime(int index) async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (selectedTime != null) {
      DateTime now = DateTime.now();
      DateTime endTime = DateTime(
        now.year,
        now.month,
        now.day,
        selectedTime.hour,
        selectedTime.minute,
      );
      setState(() {
        sleepEntries[index].endTime = endTime;
        saveSleepEntries(); // Save sleep entries after updating an entry
      });
    }
  }

  // Function to calculate total sleep duration
  Duration calculateTotalSleep() {
    Duration totalSleep = Duration.zero;
    for (var entry in sleepEntries) {
      totalSleep += entry.duration;
    }
    return totalSleep;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sleep Monitoring',
          style:
              TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Total Sleep: ${calculateTotalSleep().inHours} hours and ${calculateTotalSleep().inMinutes.remainder(60)} minutes',
              style: TextStyle(fontSize: 18.0, color: Colors.black87),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: sleepEntries.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  color: Colors.white,
                  child: ListTile(
                    title: Text(
                      'Sleep entry ${index + 1}',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Start: ${sleepEntries[index].startTime}',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.grey[700]),
                        ),
                        Text(
                          'End: ${sleepEntries[index].endTime != null ? sleepEntries[index].endTime.toString() : 'Not Ended'}',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.grey[700]),
                        ),
                        Text(
                          'Duration: ${sleepEntries[index].duration.inHours} hours and ${sleepEntries[index].duration.inMinutes.remainder(60)} minutes',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.grey[700]),
                        ),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (sleepEntries[index].endTime == null)
                          ElevatedButton(
                            onPressed: () {
                              // End sleep time when button is pressed
                              endSleepTime(index);
                            },
                            child: Text(
                              'End Sleep',
                              style: TextStyle(fontFamily: 'Montserrat'),
                            ),
                          ),
                        SizedBox(width: 8.0),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            // Delete sleep entry when delete button is pressed
                            deleteSleepEntry(index);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Add a sleep entry with the current time as the start time
                addSleepEntry();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurpleAccent,
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
              ),
              child: Text(
                'Add Sleep Entry',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SleepEntry {
  final DateTime startTime;
  DateTime? endTime;

  SleepEntry(this.startTime, this.endTime);

  Duration get duration {
    if (endTime != null) {
      return endTime!.difference(startTime);
    } else {
      return Duration.zero;
    }
  }

  // Convert SleepEntry to String for saving to SharedPreferences
  String toString() {
    return '$startTime|${endTime ?? 'null'}';
  }

  // Create SleepEntry from String loaded from SharedPreferences
  factory SleepEntry.fromString(String entry) {
    List<String> parts = entry.split('|');
    DateTime startTime = DateTime.parse(parts[0]);
    DateTime? endTime = parts[1] == 'null' ? null : DateTime.parse(parts[1]);
    return SleepEntry(startTime, endTime);
  }
}
