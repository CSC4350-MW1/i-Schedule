import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/LoginPage.dart';

void main() async {
  await Firebase.initializeApp();
  runApp(iScheduleApp());
}

class iScheduleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

// This widget is the root of your application.
@override
Widget build(BuildContext context) {
  return MaterialApp(
    title: 'i-Schdule',
    theme: ThemeData(
      primarySwatch: Colors.blueGrey,
    ),
    home: LoginPage(),
  );
}
