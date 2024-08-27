import 'package:myblog/app/modules/home/models/user_model.dart';

class Post {
  final int id;
  final String title;
  final String slug;
  final String content;
  final String image;
  final String createdAt;
  final User user;

  Post({
    required this.id,
    required this.title,
    required this.slug,
    required this.content,
    required this.image,
    required this.createdAt,
    required this.user,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      slug: json['slug'],
      content: json['content'],
      image: json['image'],
      createdAt: json['created_at'],
      user: User.fromJson(json['user']),
    );
  }
}
