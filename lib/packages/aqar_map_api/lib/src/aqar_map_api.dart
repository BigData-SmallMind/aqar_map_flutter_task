import 'package:aqar_map/packages/aqar_map_api/lib/aqar_map_api.dart';
import 'package:aqar_map/packages/aqar_map_api/lib/src/url_builder.dart';
import 'package:dio/dio.dart';


class AqarMapApi {
  AqarMapApi()
      : _dio = Dio(),
        _urlBuilder = const UrlBuilder() {
    _dio.setUpAuthHeaders();
    _dio.interceptors.add(
      LogInterceptor(
        error: false,
        request: false,
        requestBody: false,
        requestHeader: false,
        responseBody: false,
        responseHeader: false,
        logPrint: (_) {},
      ),
    );
  }
  static const _resultsJsonKey = 'results';
  final Dio _dio;
  final UrlBuilder _urlBuilder;

  Future<List<MovieRM>> getMovies() async {
    final url = _urlBuilder.buildGetPopularMoviesUrl();
    try {
      final response = await _dio.get(
        url,
      );
      final jsonMoviesList = response.data[_resultsJsonKey] as List;
      final movies = jsonMoviesList
          .map((movie) => MovieRM.fromJson(movie))
          .toList();
      return movies;
    }  catch (dioError) {
      // When an unregistered email is sent to the API, it returns 404.
      // That can be considered a security breach, so we prefer handling an
      // unregistered email just like a registered one.

      rethrow;
    }
  }

}

extension on Dio {
  void setUpAuthHeaders() {
    options = BaseOptions(
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      connectTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );
    interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.headers.addAll({
            "Accept": "application/json",
          });
          return handler.next(options);
        },
      ),
    );
  }
}
