
class MovieModel {
  String? backdropPath;
  int? id;
  String? title;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? mediaType;
  bool? adult;
  String? originalLanguage;
  List<int>? genreIds;
  double? popularity;
  String? releaseDate;
  bool? video;
  double? voteAverage;
  int? voteCount;

  MovieModel({
    this.backdropPath,
    this.id,
    this.title,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.mediaType,
    this.adult,
    this.originalLanguage,
    this.genreIds,
    this.popularity,
    this.releaseDate,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  @override
  String toString() {
    return 'MovieModel(backdropPath: $backdropPath, id: $id, title: $title, originalTitle: $originalTitle, overview: $overview, posterPath: $posterPath, mediaType: $mediaType, adult: $adult, originalLanguage: $originalLanguage, genreIds: $genreIds, popularity: $popularity, releaseDate: $releaseDate, video: $video, voteAverage: $voteAverage, voteCount: $voteCount)';
  }

  factory MovieModel.fromMap(Map<String, dynamic> data) => MovieModel(
        backdropPath: data['backdrop_path'] as String?,
        id: data['id'] as int?,
        title: data['title'] as String?,
        originalTitle: data['original_title'] as String?,
        overview: data['overview'] as String?,
        posterPath: data['poster_path'] as String?,
        mediaType: data['media_type'] as String?,
        adult: data['adult'] as bool?,
        originalLanguage: data['original_language'] as String?,
        genreIds: data['genre_ids'] as List<int>?,
        popularity: (data['popularity'] as num?)?.toDouble(),
        releaseDate: data['release_date'] as String?,
        video: data['video'] as bool?,
        voteAverage: (data['vote_average'] as num?)?.toDouble(),
        voteCount: data['vote_count'] as int?,
      );


}
