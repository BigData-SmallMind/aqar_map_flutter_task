import 'package:json_annotation/json_annotation.dart';

part 'movie_rm.g.dart';

@JsonSerializable(createToJson: false)
class MovieRM {
  const MovieRM({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
  });

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'original_title')
  final String title;
  @JsonKey(name: 'overview')
  final String overview;
  @JsonKey(name: 'poster_path')
  final String posterPath;


  static const fromJson = _$MovieRMFromJson;
}
