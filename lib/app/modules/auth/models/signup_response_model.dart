class SignupResponseModel {
  final int id;
  final String phone;
  final String createdAt;
  final String updatedAt;
  final String? message;

  SignupResponseModel({
    required this.id,
    required this.phone,
    required this.createdAt,
    required this.updatedAt,
    this.message,
  });

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) =>
      SignupResponseModel(
        id: json['data']['id'],
        phone: json['data']['phone'],
        createdAt: json['data']['created_at'],
        updatedAt: json['data']['updated_at'],
        message: json['message'],
      );
}
