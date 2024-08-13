// token_model.dart
class RefreshTokenModel {
  final String token;
  final String tokenType;
  final int expiresIn;

  RefreshTokenModel({
    required this.token,
    required this.tokenType,
    required this.expiresIn,
  });

  factory RefreshTokenModel.fromJson(Map<String, dynamic> json) {
    return RefreshTokenModel(
      token: json['token'],
      tokenType: json['token_type'],
      expiresIn: json['expires_in'],
    );
  }
}
