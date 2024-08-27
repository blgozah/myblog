class Profile {
  final int id;
  final String name;
  final String email;
  final String username;
  final String? bio;
  final int userId;
  final String createdAt;
  final String? updatedAt;

  Profile({
    required this.id,
    required this.name,
    required this.email,
    required this.username,
    this.bio,
    required this.userId,
    required this.createdAt,
    this.updatedAt,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      username: json['username'],
      bio: json['bio'],
      userId: json['user_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
