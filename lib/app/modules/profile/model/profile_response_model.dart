class ProfileResponseModel {
  final int id;
  final int userId;
  final String username;
  final String name;
  final String email;

  ProfileResponseModel({
    required this.id,
    required this.userId,
    required this.username,
    required this.name,
    required this.email,
  });

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) {
    return ProfileResponseModel(
      id: json['id'],
      userId: json['user_id'],
      username: json['username'],
      name: json['name'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'username': username,
      'name': name,
      'email': email,
    };
  }
}
