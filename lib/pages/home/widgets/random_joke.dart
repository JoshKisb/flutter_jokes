import 'package:flutter/material.dart';
import 'package:jokes_app/models/joke.dart';
import 'package:jokes_app/viewmodels/home_model.dart';
import 'package:provider/provider.dart';

class RandomJokeWidget extends StatefulWidget {
  @override
  _RandomJokeWidgetState createState() => _RandomJokeWidgetState();
}

class _RandomJokeWidgetState extends State<RandomJokeWidget> {
  @override
  void initState() {
    final model = Provider.of<HomeModel>(context, listen: false);
    model.initModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeModel>(context);
    return Column(
      children: <Widget>[
        buildJokeWidget(model),
        RaisedButton(
          onPressed: () => model.getJoke(),
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: (model.viewState == ViewState.loading)
                  ? CircularProgressIndicator()
                  : Icon(Icons.refresh)),
        )
      ],
    );
  }

  Widget buildJokeCard(Joke joke) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Text(joke.setup),
            SizedBox(
              height: 10,
            ),
            Text(joke.punchline),
          ],
        ),
      ),
    );
  }

  buildJokeWidget(HomeModel model) {
    switch (model.viewState) {
      case ViewState.failed:
        return Text("${model.error}");
      case ViewState.loaded:
      case ViewState.loading:
        return buildJokeCard(model.joke);
      default:
        return CircularProgressIndicator();
    }
  }
}
