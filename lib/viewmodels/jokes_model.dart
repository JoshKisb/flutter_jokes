import 'package:flutter/material.dart';
import 'package:jokes_app/models/joke.dart';
import 'package:jokes_app/services/api.dart';

enum ViewState { initial, loading, loaded, failed }

class JokesModel with ChangeNotifier {
  // FIXME: Should be injected through provider or get_it
  ApiService _apiService = ApiService();

  ViewState _viewState = ViewState.initial;
  ViewState get viewState => _viewState;

  List<Joke> _jokes;
  List<Joke> get jokes => _jokes;

  String error;

  initModel() {
    loadJokesFromApi();
  }

  void loadJokesFromApi() {
    _apiService.fetchJokes().then((List<Joke> jokes) {
      _jokes = jokes;
      _viewState = ViewState.loaded;
    }).catchError((errorMsg) {
      error = errorMsg;
      _viewState = ViewState.failed;
    }).whenComplete(() {
      notifyListeners();
    });
  }

  // TODO: change this to add more to existing list 
  void getJokes() {
    _viewState = ViewState.loading;
    notifyListeners();
    loadJokesFromApi();
  }

}