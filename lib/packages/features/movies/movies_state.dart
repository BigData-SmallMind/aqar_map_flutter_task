part of 'movies_cubit.dart';

class MoviesState extends Equatable {
  const MoviesState({
    this.moviesStatus = MoviesStatus.initial,
    this.movieList = const [],
    this.error,
  });

  final MoviesStatus moviesStatus;
  final List<Movie>? movieList;
  final dynamic error;

  MoviesState copyWith({
    MoviesStatus? moviesStatus,
    List<Movie>? movieList,
    dynamic error,
  }) {
    return MoviesState(
      moviesStatus: moviesStatus ?? this.moviesStatus,
      movieList: movieList,
      error: error,
    );
  }

  @override
  List<Object?> get props => [
        moviesStatus,
        movieList,
        error,
      ];
}

enum MoviesStatus {
  initial,
  loading,
  success,
  failure,
}
