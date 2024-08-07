class SignupRequestModel {
  final String phone;
  final String password;
  final String passwordConformation;

  SignupRequestModel(
      {required this.phone,
      required this.password,
      required this.passwordConformation});

  Map<String, dynamic> toJson() => {
        'phone': phone,
        'password': password,
        "password_confirmation": passwordConformation
      };
}
