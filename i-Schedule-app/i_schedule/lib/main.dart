import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:i_schedule/screens/HomePage.dart';
import 'package:i_schedule/screens/RegisterPage.dart';
import 'screens/LoginPage.dart';
import 'services/notifications.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await NotificationService().iOSinit();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyDhz4nBw4Tn0hQy3V21ct_4uL3vRb4XiB4",
    appId: "1:838849990624:android:04201a5f54050bce192585",
    messagingSenderId: "iSchedule",
    projectId: "ischedule-6976f",
  ));
  final FirebaseAuth _fireauth = FirebaseAuth.instance;
  _fireauth.authStateChanges().listen((User? user) {
    if (user == null) {
      runApp(iScheduleAppNewUser());
    } else {
      runApp(iScheduleAppNewUser());
    }
  });
}

class iScheduleAppExistingUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class iScheduleAppNewUser extends StatelessWidget {
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
