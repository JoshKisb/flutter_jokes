import 'package:flutter/material.dart';
import 'package:jokes_app/models/joke.dart';
import 'package:jokes_app/services/api.dart';

enum ViewState { initial, loading, loaded, failed }

class HomeModel with ChangeNotifier {
  // FIXME: Should be injected through provider or get_it
  ApiService _apiService = ApiService();

  ViewState _viewState = ViewState.initial;
  ViewState get viewState => _viewState;

  Joke _joke;
  Joke get joke => _joke;

  String error;

  initModel() {
    loadJokeFromApi();
  }

  void loadJokeFromApi() {
    _apiService.fetchRandomJoke().then((Joke joke) {
      _joke = joke;
      _viewState = ViewState.loaded;
    }).catchError((errorMsg) {
      error = errorMsg;
      _viewState = ViewState.failed;
    }).whenComplete(() {
      notifyListeners();
    });
  }

  void getJoke() {
    _viewState = ViewState.loading;
    notifyListeners();
    loadJokeFromApi();
  }
}
