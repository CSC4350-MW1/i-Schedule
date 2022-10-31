import 'package:flutter/material.dart';

import 'HomePage.dart';
import 'MakeMeetingPage.dart';

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
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.home),
            tooltip: 'Return to Home Screen',
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => HomePage()));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Padding(
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
            const Padding(
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
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 40,
              width: 180,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => HomePage()));
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                padding: const EdgeInsets.all(0.0),
                child: Ink(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment(0.8, 1),
                      colors: <Color>[
                        Color.fromARGB(255, 9, 73, 126),
                        Color.fromARGB(255, 41, 132, 206)
                      ],
                      tileMode: TileMode.mirror,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  ),
                  child: Container(
                    constraints:
                        const BoxConstraints(minWidth: 90.0, minHeight: 40.0),
                    alignment: Alignment.center,
                    child: const Text(
                      'Join Meeting',
                      style: TextStyle(
                          color: Color.fromARGB(255, 222, 222, 228),
                          fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.all(2.0),
        height: 40,
        width: 180,
        child: RaisedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => MakeMeetingPage()));
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
          padding: const EdgeInsets.all(0.0),
          child: Ink(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(0.8, 1),
                colors: <Color>[
                  Color.fromARGB(255, 9, 73, 126),
                  Color.fromARGB(255, 41, 132, 206)
                ],
                tileMode: TileMode.mirror,
              ),
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
            ),
            child: Container(
              constraints:
                  const BoxConstraints(minWidth: 90.0, minHeight: 40.0),
              alignment: Alignment.center,
              child: const Text(
                'Make a Meeting',
                style: TextStyle(
                    color: Color.fromARGB(255, 222, 222, 228), fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
