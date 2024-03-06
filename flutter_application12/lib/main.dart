import 'package:flutter/material.dart';
import 'front_page.dart';
import 'home_page.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
