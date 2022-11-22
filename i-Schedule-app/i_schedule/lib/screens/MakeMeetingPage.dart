import 'package:flutter/material.dart';

import 'HomePage.dart';
import 'JoinMeetingPage.dart';

class MakeMeetingPage extends StatefulWidget {
  @override
  _MakeMeetingState createState() => _MakeMeetingState();
}

class _MakeMeetingState extends State<MakeMeetingPage> {
  @override
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 222, 222, 228),
      appBar: AppBar(
        title: const Text("iSchedule - Create a Meeting"),
        backgroundColor: const Color.fromARGB(255, 25, 97, 156),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        actions: <Widget>[
          // Home button (Top left, returns to home screen)
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
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Meeting Title',
                    hintText: 'Enter meeting title'),
              ),
            ),
            const Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Members',
                    hintText: 'Enter member email or username'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RaisedButton(
                child: Ink(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
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
                      'Choose Date',
                      style: TextStyle(
                          color: Color.fromARGB(255, 222, 222, 228),
                          fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                onPressed: () async {
                  showDatePicker(
                      context: context,
                      initialDate: date,
                      firstDate: date,
                      lastDate: DateTime(date.year + 1, date.month, date.day));
                }),
            const SizedBox(
              height: 10,
            ),
            RaisedButton(
                child: Ink(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
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
                      'Choose Time',
                      style: TextStyle(
                          color: Color.fromARGB(255, 222, 222, 228),
                          fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                onPressed: () async {
                  showTimePicker(
                    context: context,
                    initialTime: time,
                  );
                }),
            const SizedBox(
              height: 60,
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
                      'Create Meeting',
                      style: TextStyle(
                          color: Color.fromARGB(255, 222, 222, 228),
                          fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 60,
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
                context, MaterialPageRoute(builder: (_) => JoinMeetingPage()));
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
                'Join a Meeting',
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
