class VerifyPhoneResponseModel {
  bool? status;
  String? message;

  VerifyPhoneResponseModel({this.status, this.message});

  VerifyPhoneResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}
