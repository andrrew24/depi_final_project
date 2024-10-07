import 'dart:convert';
TrendingMoviesResponseDto trendingMoviesResponseDtoFromJson(String str) => TrendingMoviesResponseDto.fromJson(json.decode(str));
String trendingMoviesResponseDtoToJson(TrendingMoviesResponseDto data) => json.encode(data.toJson());
class TrendingMoviesResponseDto {
  TrendingMoviesResponseDto({
      this.page, 
      this.results, 
      this.totalPages, 
      this.totalResults,});

  TrendingMoviesResponseDto.fromJson(dynamic json) {
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;
TrendingMoviesResponseDto copyWith({  int? page,
  List<Results>? results,
  int? totalPages,
  int? totalResults,
}) => TrendingMoviesResponseDto(  page: page ?? this.page,
  results: results ?? this.results,
  totalPages: totalPages ?? this.totalPages,
  totalResults: totalResults ?? this.totalResults,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    return map;
  }

}

Results resultsFromJson(String str) => Results.fromJson(json.decode(str));
String resultsToJson(Results data) => json.encode(data.toJson());
class Results {
  Results({
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
      this.voteCount,});

  Results.fromJson(dynamic json) {
    backdropPath = json['backdrop_path'];
    id = json['id'];
    title = json['title'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    mediaType = json['media_type'];
    adult = json['adult'];
    originalLanguage = json['original_language'];
    genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<int>() : [];
    popularity = json['popularity'];
    releaseDate = json['release_date'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
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
Results copyWith({  String? backdropPath,
  int? id,
  String? title,
  String? originalTitle,
  String? overview,
  String? posterPath,
  String? mediaType,
  bool? adult,
  String? originalLanguage,
  List<int>? genreIds,
  double? popularity,
  String? releaseDate,
  bool? video,
  double? voteAverage,
  int? voteCount,
}) => Results(  backdropPath: backdropPath ?? this.backdropPath,
  id: id ?? this.id,
  title: title ?? this.title,
  originalTitle: originalTitle ?? this.originalTitle,
  overview: overview ?? this.overview,
  posterPath: posterPath ?? this.posterPath,
  mediaType: mediaType ?? this.mediaType,
  adult: adult ?? this.adult,
  originalLanguage: originalLanguage ?? this.originalLanguage,
  genreIds: genreIds ?? this.genreIds,
  popularity: popularity ?? this.popularity,
  releaseDate: releaseDate ?? this.releaseDate,
  video: video ?? this.video,
  voteAverage: voteAverage ?? this.voteAverage,
  voteCount: voteCount ?? this.voteCount,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['backdrop_path'] = backdropPath;
    map['id'] = id;
    map['title'] = title;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['poster_path'] = posterPath;
    map['media_type'] = mediaType;
    map['adult'] = adult;
    map['original_language'] = originalLanguage;
    map['genre_ids'] = genreIds;
    map['popularity'] = popularity;
    map['release_date'] = releaseDate;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    return map;
  }

}