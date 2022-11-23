import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/LoginPage.dart';

void main() async {
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyDhz4nBw4Tn0hQy3V21ct_4uL3vRb4XiB4",
    appId: "1:838849990624:android:04201a5f54050bce192585",
    messagingSenderId: "iSchedule",
    projectId: "ischedule-6976f",
  ));
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
