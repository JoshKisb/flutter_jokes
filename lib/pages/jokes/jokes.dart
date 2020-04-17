import 'package:flutter/material.dart';
import 'package:jokes_app/pages/jokes/widgets/jokes_list.dart';
import 'package:jokes_app/viewmodels/jokes_model.dart';
import 'package:provider/provider.dart';

class JokesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return JokeListWidget(Provider.of<JokesModel>(context));
  }
}
