import 'dart:convert';

ProductionCountries productionCountriesFromJson(String str) =>
    ProductionCountries.fromJson(json.decode(str));
String productionCountriesToJson(ProductionCountries data) =>
    json.encode(data.toJson());

class ProductionCountries {
  ProductionCountries({
    this.iso31661,
    this.name,
  });

  ProductionCountries.fromJson(dynamic json) {
    iso31661 = json['iso_3166_1'];
    name = json['name'];
  }
  String? iso31661;
  String? name;
  ProductionCountries copyWith({
    String? iso31661,
    String? name,
  }) =>
      ProductionCountries(
        iso31661: iso31661 ?? this.iso31661,
        name: name ?? this.name,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['iso_3166_1'] = iso31661;
    map['name'] = name;
    return map;
  }
}
