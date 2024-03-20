import 'package:flutter/material.dart';

class HealthReportPage extends StatelessWidget {
  final Map<String, String> healthData;

  const HealthReportPage({super.key, required this.healthData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health Report'),
      ),
      body: ListView.builder(
        itemCount: healthData.length,
        itemBuilder: (context, index) {
          var key = healthData.keys.elementAt(index);
          var value = healthData[key];
          return ListTile(
            title: Text(key),
            subtitle: Text(value ?? ''),
          );
        },
      ),
    );
  }
}