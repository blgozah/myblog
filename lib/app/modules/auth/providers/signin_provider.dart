import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myblog/app/modules/auth/models/models.dart';


class SigninProvider extends GetConnect {

  final storage = GetStorage();
  final String _contentType = 'application/json';

  Map<String, String> getHeaders(){
    final String authorizationToken = storage.read('jwt_token');
    Map<String, String> headers = <String, String>{};

      // 'Authorization': 'Bearer $authorizationToken',


      headers.assign('Content-Type', _contentType);
    
    return headers;
  }

  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return SigninRequestModel.fromJson(map);
      if (map is List) return map.map((item) => SigninRequestModel.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'https://myblog.mobaen.com/api/';
  }

  Future<SigninRequestModel?> getSignin(int id) async {
    final response = await get('signin/$id');
    return response.body;
  }

  Future<Response<SigninResponseModel>> postSignin(SigninRequestModel signin) async =>
      await post('signin', signin.toJson(), contentType: _contentType,decoder: (data) {
      return SigninResponseModel.fromJson(data);
    });

  Future<Response> deleteSignin(int id) async => await delete('signin/$id');
}
