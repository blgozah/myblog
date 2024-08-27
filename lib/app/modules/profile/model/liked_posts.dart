class LikePost {
  final int id;
  final String title;
  final String slug;
  final String content;
  final String image;
  final String createdAt;
  final Pivot pivot;

  LikePost({
    required this.id,
    required this.title,
    required this.slug,
    required this.content,
    required this.image,
    required this.createdAt,
    required this.pivot,
  });

  factory LikePost.fromJson(Map<String, dynamic> json) {
    return LikePost(
      id: json['id'],
      title: json['title'],
      slug: json['slug'],
      content: json['content'],
      image: json['image'],
      createdAt: json['created_at'],
      pivot: Pivot.fromJson(json['pivot']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'slug': slug,
      'content': content,
      'image': image,
      'created_at': createdAt,
      'pivot': pivot.toJson(),
    };
  }
}

class Pivot {
  final int userId;
  final int postId;

  Pivot({
    required this.userId,
    required this.postId,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) {
    return Pivot(
      userId: json['user_id'],
      postId: json['post_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'post_id': postId,
    };
  }
}
