import 'package:flutter/cupertino.dart';

class Joke {
  int id;
  String type;
  String setup;
  String punchline;

  Joke({
    this.id,
    this.type,
    @required this.setup,
    @required this.punchline,
  });

  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(
        id: json["id"],
        type: json["type"],
        setup: json["setup"],
        punchline: json["punchline"]);
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "setup": setup,
        "punchline": punchline,
      };
}
