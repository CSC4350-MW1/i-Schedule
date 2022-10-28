import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 222, 222, 228),
      appBar: AppBar(
        title: const Text("Home Page"),
        backgroundColor: const Color.fromARGB(255, 25, 97, 156),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      // Scrollable block of meetings involving user
      body: Container(
        padding: const EdgeInsets.all(10),
        width: 250,
        alignment: Alignment.topLeft,
        // Should grab user's meetings from Firebase, currently just placeholder
        child: ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return RaisedButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 25, 97, 156),
        onPressed: () {},
        tooltip: 'Create new Meeting',
        child: const Icon(Icons.add),
      ),
    );
  }
}
