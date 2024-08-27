class PostResponseModel {
  final int id;
  final String title;
  final String slug;
  final String content;
  final String image;
  final String createdAt;
  final String? message;

  PostResponseModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.content,
    required this.image,
    required this.createdAt,
    this.message,
  });

  factory PostResponseModel.fromJson(Map<String, dynamic> json) {
    return PostResponseModel(
      id: json['data']['id'],
      title: json['data']['title'],
      slug: json['data']['slug'],
      content: json['data']['content'],
      image: json['data']['image'],
      createdAt: json['data']['created_at'],
      message: json['message'],
    );
  }
}
