import 'package:get/get.dart';
import 'package:myblog/app/modules/auth/models/models.dart';

class VerifyPhoneProvider extends GetConnect {
  final String _contentType = 'application/json';

  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) {
        return VerifyPhoneResponseModel.fromJson(map);
      }
      return null;
    };
    httpClient.baseUrl = 'https://myblog.mobaen.com/api/';
  }

  Future<Response<VerifyPhoneResponseModel>> postVerifyPhone(
      String phone, String code) async {
    final data = {'phone': phone, 'code': code};
    return await post('phone/verify', data,
        contentType: _contentType,
        decoder: (data) => VerifyPhoneResponseModel.fromJson(data));
  }
}
