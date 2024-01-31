import 'package:aqar_map/packages/component_library/lib/show_animated_dialog.dart';
import 'package:aqar_map/packages/component_library/lib/src/theme/movie_dialog.dart';
import 'package:aqar_map/packages/features/movies/movies_screen.dart';
import 'package:aqar_map/packages/movie_repository/lib/movie_repository.dart';
import 'package:flutter/material.dart';

import 'package:aqar_map/tab_container_screen.dart';
import 'package:routemaster/routemaster.dart';

Map<String, PageBuilder> buildRoutingTable({
  required RoutemasterDelegate routerDelegate,
  required MovieRepository movieRepository,
}) {
  return {
    _PathConstants.tabContainerPath: (_) => TabPage(
          child: const TabContainerScreen(),
          paths: [
            _PathConstants.moviesPath,
            _PathConstants.moviesPath,
          ],
          backBehavior: TabBackBehavior.history,
        ),
    _PathConstants.moviesPath: (_) {
      return MaterialPage(
        name: 'movies',
        child: Builder(builder: (context) {
          return MoviesScreen(
            movieRepository: movieRepository,
            onMovieCardTapped: (movie) {
              showAnimatedDialog(context, MovieDialog(movie: movie));
            },
          );
        }),
      );
    },
  };
}

class _PathConstants {
  const _PathConstants._();

  static String get tabContainerPath => '/';

  static String get moviesPath => '${tabContainerPath}movies';
}
