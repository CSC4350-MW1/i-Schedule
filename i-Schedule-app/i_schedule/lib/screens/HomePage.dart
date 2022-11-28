// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:i_schedule/services/fireserv.dart';

import 'JoinMeetingPage.dart';
import 'MakeMeetingPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  final FirebaseAuth _fireauth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  Widget build(BuildContext context) {
    print(getUserMeetingsTitles(
        db.collection("users").doc(_fireauth.currentUser!.email)));
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 222, 222, 228),
      appBar: AppBar(
        title: const Text("iSchedule - Home"),
        backgroundColor: const Color.fromARGB(255, 25, 97, 156),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        actions: <Widget>[
          Stack(children: [
            // Notifications Button (Top right, opens popup)
            IconButton(
              padding: const EdgeInsets.all(15),
              constraints: const BoxConstraints(minWidth: 30, minHeight: 30),
              icon: const Icon(Icons.notifications),
              tooltip: 'Notifications',
              color: const Color.fromARGB(255, 202, 202, 211),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      _buildNotificationsPopupDialog(context),
                );
              },
            ),
          ])
        ],
      ),
      // Scrollable block of meetings involving user (body of home)
      body: Container(
        padding: const EdgeInsets.all(10),
        width: 250,
        alignment: Alignment.topLeft,
        child: ListView.builder(
          padding: const EdgeInsets.only(bottom: 20),
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            return RaisedButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                color: const Color.fromARGB(255, 202, 202, 211),
                child: Text(
                  ('Placeholder Meeting ') + (index + 1).toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 15, 75, 124),
                      fontSize: 13),
                ));
          },
        ),
      ),
      // Floating add button (Bottom right, used to join/make a meeting)
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 25, 97, 156),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) =>
                _buildNewMeetingPopupDialog(context),
          );
        },
        tooltip: 'Create or join a meeting',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildNotificationsPopupDialog(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 222, 222, 228),
      title: const Text(
        'Notifications',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 25, 97, 156),
          fontSize: 16,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              color: const Color.fromARGB(255, 202, 202, 211),
              padding: const EdgeInsets.all(20),
              onPressed: (() {}),
              child: const Text('Placeholder Meeting Invite')),
          const SizedBox(
            height: 5,
          ),
          RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              color: const Color.fromARGB(255, 202, 202, 211),
              padding: const EdgeInsets.all(20),
              onPressed: (() {}),
              child: const Text('Placeholder Organization Invite'))
        ],
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text(
            'Close',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 25, 97, 156),
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}

Widget _buildNewMeetingPopupDialog(BuildContext context) {
  return AlertDialog(
    backgroundColor: const Color.fromARGB(255, 222, 222, 228),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            color: const Color.fromARGB(255, 202, 202, 211),
            onPressed: (() {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => JoinMeetingPage()));
            }),
            child: const Text('Join an existing meeting')),
        const SizedBox(
          height: 10,
        ),
        RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            color: const Color.fromARGB(255, 202, 202, 211),
            onPressed: (() {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => MakeMeetingPage()));
            }),
            child: const Text('Create a new meeting'))
      ],
    ),
    actions: <Widget>[
      FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text(
          'Close',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 25, 97, 156),
            fontSize: 12,
          ),
        ),
      ),
    ],
  );
}

// generateMeetingsButtons(DocumentReference user) async {
//   var userTitles = getUserMeetingsTitles(getUserRef());
//   (BuildContext context, int index) {
//     return RaisedButton(
//         onPressed: () {},
//         shape:
//             RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
//         color: const Color.fromARGB(255, 202, 202, 211),
//         child: Text(
//           (userTitles.),
//           style: const TextStyle(
//               fontWeight: FontWeight.bold,
//               color: Color.fromARGB(255, 15, 75, 124),
//               fontSize: 13),
//         ));
//   };
// }
