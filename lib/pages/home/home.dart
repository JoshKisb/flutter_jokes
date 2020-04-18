import 'package:flutter/material.dart';
import 'package:jokes_app/pages/home/widgets/random_joke.dart';
import 'package:jokes_app/viewmodels/home_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Random",
            style: Theme.of(context).textTheme.headline1,
          ),
          Consumer<HomeModel>(
            builder: (_, model, __) => RandomJokeWidget(model),
          ),
        ],
      ),
    );
  }
}
