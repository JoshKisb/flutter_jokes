import 'package:flutter/material.dart';
import 'package:jokes_app/pages/jokes/widgets/joke_item.dart';
import 'package:jokes_app/viewmodels/jokes_model.dart';
import 'package:provider/provider.dart';

class JokeListWidget extends StatefulWidget {
  @override
  _JokeListWidgetState createState() => _JokeListWidgetState();
}

class _JokeListWidgetState extends State<JokeListWidget> {
  @override
  void initState() {
    final model = Provider.of<JokesModel>(context, listen: false);
    model.initModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<JokesModel>(context);
    return Container(child: buildJokeList(model));
  }

  buildJokeList(JokesModel model) {
    switch (model.viewState) {
      case ViewState.failed:
        return Text("${model.error}");
      case ViewState.loaded:
        return ListView.builder(
            itemCount: model.jokes.length,
            itemBuilder: (_, index) => JokeWidget(model.jokes[index]));
      default:
        return Center(
          child: CircularProgressIndicator(),
        );
    }
  }
}
