import 'package:flutter/material.dart';
import 'package:jokes_app/pages/jokes/widgets/joke_item.dart';
import 'package:jokes_app/viewmodels/jokes_model.dart';

class JokeListWidget extends StatefulWidget {
  final JokesModel model;
  JokeListWidget(this.model);

  @override
  _JokeListWidgetState createState() => _JokeListWidgetState();
}

class _JokeListWidgetState extends State<JokeListWidget> {
  @override
  void initState() {
    widget.model.initModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: buildJokeList(widget.model));
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
