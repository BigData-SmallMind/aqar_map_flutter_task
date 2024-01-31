import 'package:aqar_map/packages/domain_models/lib/domain_models.dart';
import 'package:aqar_map/packages/movie_repository/lib/movie_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit({
    required this.movieRepository,
  }) : super(
          const MoviesState(),
        ) {
    getMovies();
  }

  final MovieRepository movieRepository;

  Future<void> getMovies() async {
    try {
      final loadingState = state.copyWith(moviesStatus: MoviesStatus.loading);
      emit(loadingState);

      final movies = await movieRepository.getMoviesFromNetwork();

      final newState = state.copyWith(
        moviesStatus: MoviesStatus.success,
        movieList: movies,
      );
      emit(newState);
    } catch (error) {
      final newState = state.copyWith(moviesStatus: MoviesStatus.failure);
      emit(newState);
    }
  }

  @override
  Future<void> close() {
    debugPrint('');
    return super.close();
  }
}
