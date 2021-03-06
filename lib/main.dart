import 'package:flutter/material.dart';
import 'package:jokes_app/pages/home/home.dart';
import 'package:jokes_app/pages/jokes/jokes.dart';
import 'package:jokes_app/viewmodels/home_model.dart';
import 'package:jokes_app/viewmodels/jokes_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = [HomePage(), JokesPage(), Container()];
  
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
          body: MultiProvider(providers: [
            ChangeNotifierProvider<HomeModel>(create: (_) => HomeModel()),
            ChangeNotifierProvider<JokesModel>(create: (_) => JokesModel())
          ], child: _pages.elementAt(_selectedIndex)),
          bottomNavigationBar: bottomNavigationBar,
        ));
  }

  BottomNavigationBar get bottomNavigationBar => BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          title: Text('All'),
        ),
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.favorite),
        //   title: Text('Liked'),
        // ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
}
