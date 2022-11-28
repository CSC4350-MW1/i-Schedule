// ignore_for_file: unnecessary_const
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:i_schedule/screens/LoginPage.dart';

import 'HomePage.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  final FirebaseAuth _fireauth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  final _formKeyEmail = GlobalKey<FormState>();
  final _formKeyPassword = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 222, 222, 228),
      appBar: AppBar(
        title: const Text("iSchedule - Registration"),
        backgroundColor: const Color.fromARGB(255, 25, 97, 156),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: TextFormField(
                validator: (value) =>
                    value!.isEmpty ? "Enter a valid email" : null,
                key: _formKeyEmail,
                controller: emailController,
                //obscureText: true,
                decoration: const InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter email ID'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextFormField(
                validator: (value) =>
                    value!.isEmpty ? "Enter a valid password" : null,
                key: _formKeyPassword,
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter password'),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
                height: 40,
                width: 180,
                child: RaisedButton(
                  // Register Button On Pressed
                  onPressed: () async {
                    if (emailController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty) {
                      // Create new user in FireAuth
                      final User? newUser =
                          (await _fireauth.createUserWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passwordController.text))
                              .user;
                      // Sign into FireAuth
                      (await _fireauth.signInWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text));
                      db
                          .collection("users")
                          .doc(emailController.text)
                          .set(<String, dynamic>{
                        "email": emailController.text,
                        "password": passwordController.text,
                        "authID": newUser?.uid.toString(),
                      });
                      // emailController.dispose();
                      // passwordController.dispose();
                      // ignore: use_build_context_synchronously
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => HomePage()));
                    }
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
                        'Register',
                        style: TextStyle(
                            color: Color.fromARGB(255, 222, 222, 228),
                            fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
