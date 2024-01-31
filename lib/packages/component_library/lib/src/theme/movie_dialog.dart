import 'package:aqar_map/packages/component_library/lib/component_library.dart';
import 'package:aqar_map/packages/domain_models/lib/domain_models.dart';
import 'package:flutter/material.dart';

class MovieDialog extends StatelessWidget {
  const MovieDialog({
    required this.movie,
    Key? key,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      clipBehavior: Clip.hardEdge,
      contentPadding: EdgeInsets.zero,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            child: Image.network(
              'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(Spacing.medium),
            child: Text(movie.overview),
          )
        ],
      ),
    );
  }
}
