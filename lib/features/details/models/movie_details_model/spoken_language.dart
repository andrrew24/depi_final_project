class SpokenLanguage {
  String? englishName;
  String? iso6391;
  String? name;

  SpokenLanguage({this.englishName, this.iso6391, this.name});

  @override
  String toString() {
    return 'SpokenLanguage(englishName: $englishName, iso6391: $iso6391, name: $name)';
  }

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) {
    return SpokenLanguage(
      englishName: json['english_name'] as String?,
      iso6391: json['iso_639_1'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'english_name': englishName,
        'iso_639_1': iso6391,
        'name': name,
      };
}
