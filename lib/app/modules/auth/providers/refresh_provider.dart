import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myblog/app/modules/auth/models/refresh_token_model.dart';

class RefreshProvider extends GetConnect {
  final GetStorage _storage = GetStorage();
  final String _baseUrl = 'http://myblog.mobaen.com/api/refresh';

  Future<RefreshTokenModel?> refreshToken() async {
    final String? oldToken = _storage.read<String>('jwt_token');
    if (oldToken == null) {
      return null;
    }

    final response = await post(
      _baseUrl,
      {'refresh_token': oldToken},
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${_storage.read("jwt_token")}'
      },
    );

    if (response.status.hasError) {
      print('Failed to refresh token: ${response.statusText}');
      return null;
    } else {
      final responseData = response.body as Map<String, dynamic>;
      return RefreshTokenModel.fromJson(responseData);
    }
  }
}
