import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';
import 'RegisterPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  final FirebaseAuth _fireauth = FirebaseAuth.instance;
  final _formKeyEmail = GlobalKey<FormState>();
  final _formKeyPassword = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 222, 222, 228),
      appBar: AppBar(
        title: const Text("iSchedule - Login"),
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
              padding: const EdgeInsets.only(top: 10.0),
              child: Center(
                child: Container(
                  width: 300,
                  height: 180,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/loginImage.png'),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: TextFormField(
                key: _formKeyEmail,
                controller: emailController,
                validator: (value) =>
                    value!.isEmpty ? "Enter a valid email" : null,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter email ID'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextFormField(
                key: _formKeyPassword,
                controller: passwordController,
                validator: (value) =>
                    value!.isEmpty ? "Enter a valid password" : null,
                obscureText: true,
                decoration: const InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter password'),
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: const Text(
                'Forgot Password',
                style: TextStyle(
                    color: Color.fromARGB(255, 25, 97, 156), fontSize: 15),
              ),
            ),
            Container(
              height: 40,
              width: 180,
              child: RaisedButton(
                onPressed: () async {
                  // if (_formKeyEmail.currentState!.validate() &&
                  //     _formKeyPassword.currentState!.validate()) {}
                  signIn();
                  // emailController.dispose();
                  // passwordController.dispose();
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
                      'Login',
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
              height: 50,
            ),
            Container(
                height: 40,
                width: 180,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => RegisterPage()));
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

  signIn() async {
    await _fireauth.signInWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
  }
}
