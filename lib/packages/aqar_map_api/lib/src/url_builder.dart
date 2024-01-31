class UrlBuilder {
  const UrlBuilder() : _baseUrl = 'https://api.themoviedb.org/3';

  final String _baseUrl;
  static const _apiKey = '?api_key=a0bf367b8729b20a6291d95157d0d103';

  String buildGetPopularMoviesUrl() {
    return '$_baseUrl/movie/popular$_apiKey';
  }
}
