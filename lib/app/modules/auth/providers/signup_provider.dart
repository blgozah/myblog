import 'package:get/get.dart';
import 'package:myblog/app/modules/auth/models/models.dart';

class SignupProvider extends GetConnect {
  final String _contentType = 'application/json';

  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) {
        return SignupResponseModel.fromJson(map);
      }
      return null;
    };
    httpClient.baseUrl = 'https://myblog.mobaen.com/api/';
  }

  Future<Response<SignupResponseModel>> postSignup(
      SignupRequestModel signup) async {
    return await post(
      'signup',
      signup.toJson(),
      contentType: _contentType,
      decoder: (data) => SignupResponseModel.fromJson(data),
    );
  }
}
