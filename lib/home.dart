// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'show_more.dart'; // Import Page2

class MyHomePage extends StatefulWidget {
  final String name;
  final String school;
  final String about;
  final String history;
  final String skills;
  final String? imagePath;

  const MyHomePage({
    super.key,
    required this.name,
    required this.school,
    required this.about,
    required this.history,
    required this.skills,
    this.imagePath,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.shortestSide,
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.center,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.amber[100],
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        radius: 100.0,
                        backgroundImage: widget.imagePath != null
                            ? AssetImage(widget.imagePath!)
                            : AssetImage('img/user.png'),
                      ),
                      Text(
                        widget.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      Text(
                        widget.school,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      ),
                      TextButton(
                        onPressed: () {
                          // Navigasi ke Page2 dengan data yang sudah dimasukkan
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ShowMore(
                                name: widget.name,
                                school: widget.school,
                                about: widget.about,
                                history: widget.history,
                                skills: widget.skills,
                                imagePath: widget.imagePath,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          "Show More",
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
