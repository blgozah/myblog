import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myblog/app/modules/auth/models/refresh_token_model.dart';
import 'package:myblog/app/modules/auth/providers/refresh_provider.dart';

class RefreshTokenController extends GetxController {
  final RefreshProvider _apiProvider = RefreshProvider();
  final GetStorage _storage = GetStorage();
  var token = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _loadToken();
  }

  void _loadToken() {
    final storedToken = _storage.read<String>('jwt_token');
    if (storedToken != null) {
      token.value = storedToken;
    }
  }

  Future<void> refreshToken() async {
    final RefreshTokenModel? newTokenModel = await _apiProvider.refreshToken();
    if (newTokenModel != null) {
      token.value = newTokenModel.token;
      print(token.value);
      _storage.write('jwt_token', newTokenModel.token);
      print("token is refreshed");
    }
  }
}
