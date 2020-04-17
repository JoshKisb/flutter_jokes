import 'package:flutter/material.dart';
import 'package:jokes_app/models/joke.dart';

class JokeWidget extends StatelessWidget {
  final Joke joke;
  JokeWidget(this.joke);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Card(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Column(
            children: <Widget>[
              Text(joke.setup),
              SizedBox(height: 10),
              Text(joke.punchline)
            ],
          ),
        ),
      ),
    );
  }
}
