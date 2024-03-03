import 'package:flutter/material.dart';
import 'front_page.dart';
import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Doc',
      theme: ThemeData(),
      initialRoute: '/',
      routes: {
        '/': (context) => FrontPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
