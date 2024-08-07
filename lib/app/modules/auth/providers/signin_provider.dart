import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myblog/app/modules/auth/models/models.dart';

class SigninProvider extends GetConnect {
  final storage = GetStorage();
  final String _contentType = 'application/json';

  Map<String, String> getHeaders() {
    final String authorizationToken = storage.read('jwt_token');
    final Map<String, String> headers = <String, String>{};
    headers['Content-Type'] = _contentType;
    headers['Authorization'] = 'Bearer $authorizationToken';
    return headers;
  }

  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return SigninResponseModel.fromJson(map);
      if (map is List) {
        return map.map((item) => SigninResponseModel.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = 'https://myblog.mobaen.com/api/';
  }

  Future<Response<SigninResponseModel>> postSignin(
          SigninRequestModel signin) async =>
      await post('signin', signin.toJson(), contentType: _contentType,
          decoder: (data) {
        return SigninResponseModel.fromJson(data);
      });
}
