import 'dart:convert';

BelongsToCollection belongsToCollectionFromJson(String str) => BelongsToCollection.fromJson(json.decode(str));
String belongsToCollectionToJson(BelongsToCollection data) => json.encode(data.toJson());
class BelongsToCollection {
  BelongsToCollection({
      this.id, 
      this.name, 
      this.posterPath, 
      this.backdropPath,});

  BelongsToCollection.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    posterPath = json['poster_path'];
    backdropPath = json['backdrop_path'];
  }
  int? id;
  String? name;
  String? posterPath;
  String? backdropPath;
BelongsToCollection copyWith({  int? id,
  String? name,
  String? posterPath,
  String? backdropPath,
}) => BelongsToCollection(  id: id ?? this.id,
  name: name ?? this.name,
  posterPath: posterPath ?? this.posterPath,
  backdropPath: backdropPath ?? this.backdropPath,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['poster_path'] = posterPath;
    map['backdrop_path'] = backdropPath;
    return map;
  }

}