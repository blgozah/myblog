class SigninRequestModel {
  String? phone;
  String? password;

  SigninRequestModel({this.phone, this.password});

  SigninRequestModel.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['phone'] = phone;
    data['password'] = password;
    return data;
  }
}
