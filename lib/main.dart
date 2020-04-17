import 'package:flutter/material.dart';
import 'package:jokes_app/pages/home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Jokes App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Dad Jokes App"),
          ),
          body: HomePage(),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                title: Text('All'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                title: Text('Liked'),
              ),
            ],
            currentIndex: 0,
            selectedItemColor: Colors.amber[800],
            onTap: (_) {},
          ),
        ));
  }
}
