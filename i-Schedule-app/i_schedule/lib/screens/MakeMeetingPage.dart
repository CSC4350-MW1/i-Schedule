// ignore_for_file: deprecated_member_use, unused_local_variable, use_build_context_synchronously
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'HomePage.dart';
import 'JoinMeetingPage.dart';
import 'package:i_schedule/services/fireserv.dart';

class MakeMeetingPage extends StatefulWidget {
  @override
  _MakeMeetingState createState() => _MakeMeetingState();
}

class _MakeMeetingState extends State<MakeMeetingPage> {
  @override
  final FirebaseAuth _fireauth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  final titleController = TextEditingController();
  final membersController = TextEditingController();
  late DateTime inputDate;
  late TimeOfDay inputTime;

  //Future<dynamic>? inputTime;
  Widget build(BuildContext context) {
    var userRef = db.collection("users").doc(_fireauth.currentUser!.email);
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
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Meeting Title',
                    hintText: 'Enter meeting title'),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
              child: TextFormField(
                controller: membersController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Members',
                    hintText: 'Enter member email'),
              ),
            ),
            Container(
              height: 10,
              child: Text(
                membersController.text,
                style: TextStyle(
                    color: Color.fromARGB(255, 222, 222, 228), fontSize: 10),
                textAlign: TextAlign.left,
              ),
            ),
            // Date Selection Button
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
                // Date Button On Press
                onPressed: () async {
                  inputDate = (await showDatePicker(
                      context: context,
                      initialDate: date,
                      firstDate: date,
                      lastDate:
                          DateTime(date.year + 1, date.month, date.day)))!;
                }),
            const SizedBox(
              height: 10,
            ),
            // Time Selection Button
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
                // Time Button On Press
                onPressed: () async {
                  inputTime = (await showTimePicker(
                    context: context,
                    initialTime: time,
                  ))!;
                }),
            const SizedBox(
              height: 60,
            ),
            SizedBox(
              height: 40,
              width: 180,
              // Create Meeting Button
              child: RaisedButton(
                onPressed: () async {
                  HapticFeedback.heavyImpact();
                  // Add Meeting to Meetings Collection
                  var newMeeting = await db.collection("meetings").add(<String,
                      dynamic>{
                    "date": inputDate
                        .toString()
                        .substring(0, inputDate.toString().indexOf(" ")),
                    "members": membersController.text,
                    "time": inputTime.toString().substring(
                        inputTime.toString().indexOf("(") + 1,
                        inputTime.toString().indexOf(")")),
                    "title": titleController.text
                  }).then(
                      // Add Meeting to user Meetings Collection under same FireBase generated ID
                      (DocumentReference doc) => db
                              .collection("users")
                              .doc(userRef.id)
                              .collection("meetings")
                              .doc(doc.id)
                              .set(<String, dynamic>{
                            "date": inputDate.toString().substring(
                                0, inputDate.toString().indexOf(" ")),
                            "members": membersController.text,
                            "time": inputTime.toString().substring(
                                inputTime.toString().indexOf("(") + 1,
                                inputTime.toString().indexOf(")")),
                            "title": titleController.text
                          }));

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
          padding: const EdgeInsets.all(10.0),
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
