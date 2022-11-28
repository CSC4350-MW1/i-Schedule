//import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

final FirebaseAuth _fireauth = FirebaseAuth.instance;
final FirebaseFirestore db = FirebaseFirestore.instance;

getUserRef() async {
  return await db.collection("users").doc(_fireauth.currentUser!.email);
}

// Returns List of all meetings user is in
getUserMeetings(DocumentReference user) async {
  var userRef = db.collection("users").doc(_fireauth.currentUser!.email);
  var meetingsRef = userRef.collection("meetings");
  var meetingSnaps = await userRef.collection("meetings").get();
  var meetingData = meetingSnaps.docs.map((doc) => doc.data()).toList();
  return meetingData;
}

// Returns List of titles of all meetings user is in
getUserMeetingsTitles(DocumentReference user) async {
  var userRef = await db.collection("users").doc(_fireauth.currentUser!.email);
  var meetingSnaps;
  meetingSnaps = await userRef.collection("meetings").get();

  var meetingData = meetingSnaps.docs.map((doc) => doc.data()).toList();
  List<String> meetingTitles = [];
  meetingData.forEach(
    (element) {
      meetingTitles.add(element["title"]);
    },
  );
  print(meetingTitles);
  return meetingTitles;
}

getUserMeetingTitle(DocumentReference user, int index) async {}

getMeetingsTimes(DocumentReference user) async {
  var userRef = await db.collection("users").doc(_fireauth.currentUser!.email);
  var meetingSnaps;
  meetingSnaps = await userRef.collection("meetings").get();

  var meetingData = meetingSnaps.docs.map((doc) => doc.data()).toList();
  List<String> meetingTimes = [];
  meetingData.forEach(
    (element) {
      meetingTimes.add(element["time"]);
    },
  );
  print(meetingTimes);
  return meetingTimes;
}
