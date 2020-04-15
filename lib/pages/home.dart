import 'package:flutter/material.dart';
import 'package:jokes_app/models/joke.dart';
import 'package:jokes_app/services/api.dart';

class HomePage extends StatelessWidget {
  final ApiService _apiService = ApiService();
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

            FutureBuilder(
              future: _apiService.fetchRandomJoke(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return buildJokeWidget(snapshot.data);
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }               
                return CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }

  Text buildJokeWidget(Joke joke) => Text(joke.setup);
}
