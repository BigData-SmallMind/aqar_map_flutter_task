import 'package:aqar_map/packages/domain_models/lib/domain_models.dart';
import 'package:aqar_map/packages/aqar_map_api/lib/src/models/models.dart';

extension MovieRMtoDM on MovieRM {
  Movie toDomainModel() {
    return Movie(
      id: id,
      title: title,
      overview: overview,
      posterPath: posterPath,
    );
  }
}
