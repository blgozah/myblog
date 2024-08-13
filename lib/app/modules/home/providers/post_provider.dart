import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myblog/app/modules/auth/controllers/refresh_token.dart';
import 'package:myblog/app/modules/home/models/post.dart';

class HomeProvider extends GetConnect {
  final storage = GetStorage();
  final RefreshTokenController tokenController = Get.find();
  Future<List<Post>> fetchPosts() async {
    await tokenController.refreshToken();
    final response = await get('http://myblog.mobaen.com/api/posts',
        headers: {'Authorization': 'Bearer ${storage.read("jwt_token")}'});

    if (response.statusCode == 200) {
      final data = response.body;
      return (data['data']['data'] as List)
          .map((post) => Post.fromJson(post))
          .toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
