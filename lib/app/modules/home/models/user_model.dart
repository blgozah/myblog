import 'package:myblog/app/modules/home/models/profile_model.dart';

class User {
  final int id;
  final String phone;
  final String createdAt;
  final String updatedAt;
  final Profile? profile;

  User({
    required this.id,
    required this.phone,
    required this.createdAt,
    required this.updatedAt,
    this.profile,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      phone: json['phone'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      profile:
          json['profile'] != null ? Profile.fromJson(json['profile']) : null,
    );
  }
}
