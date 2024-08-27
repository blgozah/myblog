import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
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
    super.onInit(); // Ensure that super.onInit() is called
  }

  Future<Response<PostResponseModel>> createPost(FormData postCreate) async {
    Response<PostResponseModel> response = await post(
      'https://myblog.mobaen.com/api/posts',
      postCreate,
      contentType: 'multipart/form-data',
      headers: {
        'Authorization': 'Bearer ${storage.read("jwt_token")}',
      },
      decoder: (data) => PostResponseModel.fromJson(data),
    );
    return response;
  }
}
