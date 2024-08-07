class SigninResponseModel {
  int? id;
  String? phone;
  String? createdAt;
  String? updatedAt;
  String? token;
  String? message;

  SigninResponseModel({
    this.id,
    this.phone,
    this.createdAt,
    this.updatedAt,
    this.token,
    this.message,
  });

  SigninResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['data']['id'];
    phone = json['data']['phone'];
    createdAt = json['data']['created_at'];
    updatedAt = json['data']['updated_at'];
    token = json['data']['token'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['phone'] = phone;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['token'] = token;
    data['message'] = message;
    return data;
  }
}
