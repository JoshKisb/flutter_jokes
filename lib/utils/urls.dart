class ApiUrls {
  static final baseUrl =
      "https://us-central1-dadsofunny.cloudfunctions.net/DadJokes";

  static String _buildUrl(String relativeUrl) {
    return baseUrl + relativeUrl;
  }

  static String get joke => _buildUrl("/random/jokes");
  static String get jokes => _buildUrl("/random/jokes/10");

  static String jokesOfType(String jokeType) =>
      _buildUrl("/random/type/$jokeType/10");
}
