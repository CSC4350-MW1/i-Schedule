import 'package:flutter/material.dart';

import 'HomePage.dart';

class JoinMeetingPage extends StatefulWidget {
  @override
  _JoinMeetingState createState() => _JoinMeetingState();
}

class _JoinMeetingState extends State<JoinMeetingPage> {
  @override
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 222, 222, 228),
      appBar: AppBar(
        title: const Text("iSchedule - Join a Meeting"),
        backgroundColor: const Color.fromARGB(255, 25, 97, 156),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                    labelText: 'Find Host',
                    hintText: 'Enter host\'s Email, Username, or User ID'),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                    labelText: 'Find Meeting',
                    hintText: 'Enter Meeting ID'),
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
