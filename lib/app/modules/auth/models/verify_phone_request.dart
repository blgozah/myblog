class VerifyPhoneRequest {
  final String phone;
  final String code;

  VerifyPhoneRequest({
    required this.phone,
    required this.code,
  });

  Map<String, dynamic> toJson() => {
        'phone': phone,
        'code': code,
      };
}
