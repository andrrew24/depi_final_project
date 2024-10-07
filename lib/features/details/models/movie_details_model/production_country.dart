class ProductionCountry {
  String? iso31661;
  String? name;

  ProductionCountry({this.iso31661, this.name});

  @override
  String toString() => 'ProductionCountry(iso31661: $iso31661, name: $name)';

  factory ProductionCountry.fromJson(Map<String, dynamic> json) {
    return ProductionCountry(
      iso31661: json['iso_3166_1'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'iso_3166_1': iso31661,
        'name': name,
      };
}
