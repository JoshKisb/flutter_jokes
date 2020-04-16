import 'package:flutter/material.dart';
import 'package:jokes_app/pages/home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jokes App',
      theme: ThemeData(     
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

