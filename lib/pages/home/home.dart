import 'package:flutter/material.dart';
import 'package:jokes_app/models/joke.dart';
import 'package:jokes_app/pages/home/widgets/random_joke.dart';
import 'package:jokes_app/viewmodels/home_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dad Jokes App"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text(
              "Random",
              style: Theme.of(context).textTheme.headline1,
            ),
            ChangeNotifierProvider<HomeModel>(
              create: (_) => HomeModel(),
              child: RandomJokeWidget()
            ),
          ],
        ),
      ),
    );
  }

  
}
