import 'package:aqar_map/packages/component_library/lib/component_library.dart';
import 'package:aqar_map/packages/domain_models/lib/domain_models.dart';
import 'package:aqar_map/packages/features/movies/movie_card.dart';
import 'package:aqar_map/packages/features/movies/movies_cubit.dart';
import 'package:aqar_map/packages/movie_repository/lib/movie_repository.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({
    required this.movieRepository,
    required this.onMovieCardTapped,
    super.key,
  });

  final MovieRepository movieRepository;
  final ValueSetter<Movie> onMovieCardTapped;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MoviesCubit>(
      create: (context) => MoviesCubit(
        movieRepository: movieRepository,
      ),
      child: GestureDetector(
        onTap: () => _releaseFocus(context),
        child: MoviesView(
          onMovieCardTapped: onMovieCardTapped,
        ),
      ),
    );
  }
}

class MoviesView extends StatelessWidget {
  const MoviesView({
    super.key,
    required this.onMovieCardTapped,
  });

  final ValueSetter<Movie> onMovieCardTapped;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MoviesState>(
      builder: (context, state) {
        final cubit = context.read<MoviesCubit>();
        final loading = state.moviesStatus == MoviesStatus.loading;
        final failure = state.moviesStatus == MoviesStatus.failure;
        return Scaffold(
          // resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: const Text('Popular Movies'),
          ),
          body: loading
              ? const CenteredCircularProgressIndicator()
              : failure
                  ? ExceptionIndicator(
                      onTryAgain: cubit.getMovies,
                    )
                  : RefreshIndicator(
                      onRefresh: cubit.getMovies,
                      child: ListView.builder(
                          itemCount: state.movieList!.length,
                          itemBuilder: (context, index) {
                            final movie = state.movieList![index];
                            final isLastMovieInList =
                                index == state.movieList!.length - 1;
                            return MovieCard(
                              movie: movie,
                              shouldAddWhiteSpaceAtListEnd: isLastMovieInList,
                              onMovieCardTapped: onMovieCardTapped,
                            );
                          }),
                    ),
        );
      },
    );
  }
}

void _releaseFocus(BuildContext context) => FocusScope.of(context).unfocus();
