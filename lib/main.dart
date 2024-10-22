import 'package:flutter/material.dart';
import 'add_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Profile App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AddDataPage(), // Langsung membuka halaman input data
    );
  }
}
