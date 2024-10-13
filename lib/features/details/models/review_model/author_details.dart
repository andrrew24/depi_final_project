class AuthorDetails {
  final String? name;
  final String? username;
  final String? avatarPath;
  final double? rating;

  AuthorDetails({
    this.name,
    this.username,
    this.avatarPath,
    this.rating,
  });

  @override
  String toString() {
    return 'AuthorDetails(name: $name, username: $username, avatarPath: $avatarPath, rating: $rating)';
  }

  factory AuthorDetails.fromJson(Map<String, dynamic> json) => AuthorDetails(
        name: json['name'] as String?,
        username: json['username'] as String?,
        avatarPath: json['avatar_path'] as String?,
        rating: (json['rating'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'username': username,
        'avatar_path': avatarPath,
        'rating': rating,
      };
}