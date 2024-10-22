import 'package:json_annotation/json_annotation.dart';
part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel {
  @JsonKey(name: "adult")
  bool? adult;
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  @JsonKey(name: 'genre_ids')
  List<int>? genreIds;
  @JsonKey(name: 'id')
  num? id;
  @JsonKey(name: 'original_language')
  String? originalLanguage;
  @JsonKey(name: 'original_title')
  String? originalTitle;
  @JsonKey(name: 'overview')
  String? overview;
  num? popularity;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'release_date')
  String? releaseDate;
  bool? video;
  @JsonKey(name: 'vote_average')
  num? voteAverage;
  @JsonKey(name: 'vote_count')
  num? voteCount;

  MovieModel({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return _$MovieModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}

// "adult": false,
// "backdrop_path": "/417tYZ4XUyJrtyZXj7HpvWf1E8f.jpg",
// "genre_ids": [
// 16,
// 878,
// 10751
// ],
// "id": 1184918,
// "original_language": "en",
// "original_title": "The Wild Robot",
// "overview": "After a shipwreck, an intelligent robot called Roz is stranded on an uninhabited island. To survive the harsh environment, Roz bonds with the island's animals and cares for an orphaned baby goose.",
// "popularity": 7456.608,
// "poster_path": "/wTnV3PCVW5O92JMrFvvrRcV39RU.jpg",
// "release_date": "2024-09-12",
// "title": "The Wild Robot",
// "video": false,
// "vote_average": 8.7,
// "vote_count": 1059