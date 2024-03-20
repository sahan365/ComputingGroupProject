import 'package:cloud_firestore/cloud_firestore.dart';
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

  FirebaseFirestore.instance.settings=const Settings(
    persistenceEnabled: true,
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
