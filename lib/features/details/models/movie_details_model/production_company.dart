class ProductionCompany {
  int? id;
  String? logoPath;
  String? name;
  String? originCountry;

  ProductionCompany({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });

  @override
  String toString() {
    return 'ProductionCompany(id: $id, logoPath: $logoPath, name: $name, originCountry: $originCountry)';
  }

  factory ProductionCompany.fromJson(Map<String, dynamic> json) {
    return ProductionCompany(
      id: json['id'] as int?,
      logoPath: json['logo_path'] as String?,
      name: json['name'] as String?,
      originCountry: json['origin_country'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'logo_path': logoPath,
        'name': name,
        'origin_country': originCountry,
      };
}
