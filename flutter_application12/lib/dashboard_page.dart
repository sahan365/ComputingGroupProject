import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  double weight = 0;
  double height = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Weight Input
            TextFormField(
              decoration: InputDecoration(labelText: 'Enter Weight'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  weight = double.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 16.0),
            // Height Input
            TextFormField(
              decoration: InputDecoration(labelText: 'Enter Height'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  height = double.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 32.0),
            // Charts and Diagrams
            Expanded(
              child: Column(
                children: <Widget>[
                  // Weight Chart
                  Text('Weight Chart'),
                  SizedBox(height: 16.0),
                  LineChart(
                    LineChartData(/* Chart Data */),
                  ),
                  SizedBox(height: 32.0),
                  // Height Chart
                  Text('Height Chart'),
                  SizedBox(height: 16.0),
                  LineChart(
                    LineChartData(/* Chart Data */),
                  ),
                  SizedBox(height: 32.0),
                  // Circular Charts for Weight and Height
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CircularChart(/* Weight Circular Chart */),
                      CircularChart(/* Height Circular Chart */),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to create Circular Chart widget
  Widget CircularChart(/* Chart Data */) {
    return Container(
      width: 150.0,
      height: 150.0,
      child: /* CircularChart widget */,
    );
  }
}
