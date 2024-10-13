import 'author_details.dart';

class ReviewModel {
  String? author;
  AuthorDetails? authorDetails;
  String? content;
  DateTime? createdAt;
  String? id;
  DateTime? updatedAt;
  String? url;

  ReviewModel({
    this.author,
    this.authorDetails,
    this.content,
    this.createdAt,
    this.id,
    this.updatedAt,
    this.url,
  });

  @override
  String toString() {
    return 'MovieReviewModel(author: $author, authorDetails: $authorDetails, content: $content, createdAt: $createdAt, id: $id, updatedAt: $updatedAt, url: $url)';
  }

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      author: json['author'] as String?,
      authorDetails: json['author_details'] == null
          ? null
          : AuthorDetails.fromJson(
              json['author_details'] as Map<String, dynamic>),
      content: json['content'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      id: json['id'] as String?,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      url: json['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'author': author,
        'author_details': authorDetails?.toJson(),
        'content': content,
        'created_at': createdAt?.toIso8601String(),
        'id': id,
        'updated_at': updatedAt?.toIso8601String(),
        'url': url,
      };
}
