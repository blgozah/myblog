import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myblog/app/modules/create_post/model/post_create_model.dart';
import 'package:myblog/app/modules/create_post/model/post_response_model.dart';
import 'package:myblog/app/modules/auth/controllers/refresh_token.dart';

class PostProvider extends GetConnect {
  final GetStorage storage = GetStorage();
  final RefreshTokenController tokenController = Get.find();

  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) {
        return PostResponseModel.fromJson(map);
      }
      return null;
    };

    httpClient.baseUrl = 'https://myblog.mobaen.com/api/';
  }

  Future<Response<PostResponseModel>> createPost(FormData postCreate) async {
    await tokenController.refreshToken();
    print("in create post provider");
    return await post(
      'posts',
      postCreate,
      contentType: 'application/json',
      headers: {
        'Authorization': 'Bearer ${storage.read("jwt_token")}',
      },
    );
  }
}
