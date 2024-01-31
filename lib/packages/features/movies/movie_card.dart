import 'package:aqar_map/packages/component_library/lib/component_library.dart';
import 'package:aqar_map/packages/domain_models/lib/domain_models.dart';
import 'package:aqar_map/packages/features/movies/movies_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.movie,
    required this.shouldAddWhiteSpaceAtListEnd,
    required this.onMovieCardTapped,
  });

  final Movie movie;
  final bool shouldAddWhiteSpaceAtListEnd;
  final ValueSetter<Movie> onMovieCardTapped;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocBuilder<MoviesCubit, MoviesState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => onMovieCardTapped(movie),
          child: Container(
            margin: const EdgeInsets.only(
              left: 24,
              right: 24,
              bottom: Spacing.medium,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: Spacing.medium,
              vertical: Spacing.small,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: kElevationToShadow[1],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(),
                      ),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500/${movie.posterPath}',

                        fit: BoxFit.contain,
                        loadingBuilder: (ctx, obj, strace) {
                          if (strace == null) return obj;
                          return const CenteredCircularProgressIndicator();
                        },
                        errorBuilder: (ctx, obj, strace) {
                          // if (strace == null) return obj;
                          return const CenteredCircularProgressIndicator();
                        },
                      ),
                    ),
                    const SizedBox(width: Spacing.medium),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            movie.title,
                            style: textTheme.titleMedium,
                          ),
                        ),
                        SizedBox(
                          width: 240,
                          child: Text(
                            movie.overview,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: Spacing.small,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
