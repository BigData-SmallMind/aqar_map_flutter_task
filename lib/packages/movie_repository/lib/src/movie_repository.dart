import 'package:aqar_map/packages/aqar_map_api/lib/aqar_map_api.dart';
import 'package:aqar_map/packages/domain_models/lib/domain_models.dart';
import 'package:aqar_map/packages/movie_repository/lib/src/mappers/mappers.dart';

class MovieRepository {
  MovieRepository({
    required this.remoteApi,
  });

  final AqarMapApi remoteApi;

  Future<List<Movie>> getMoviesFromNetwork() async {
    try {
      final remoteMovies = await remoteApi.getMovies();
      final domainMovies =
          remoteMovies.map((movie) => movie.toDomainModel()).toList();
      return domainMovies;
    } catch (error) {
      rethrow;
    }
  }
}
