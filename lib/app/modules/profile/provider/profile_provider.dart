import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myblog/app/modules/auth/controllers/refresh_token.dart';
import 'package:myblog/app/modules/profile/model/liked_posts.dart';
import 'package:myblog/app/modules/profile/model/profile_model.dart';
import 'package:myblog/app/modules/profile/model/profile_response_model.dart';

class ProfileProvider extends GetConnect {
  //final String baseUrl = 'https://myblog.mobaen.com/api/profiles';
  final storage = GetStorage();
  final RefreshTokenController tokenController = Get.find();

  Future<ProfileResponseModel?> fetchProfileByUserId(int userId) async {
    print("in fetch profile");
    await tokenController.refreshToken();

    final response = await get('http://myblog.mobaen.com/api/profiles',
        headers: {'Authorization': 'Bearer ${storage.read("jwt_token")}'});
    if (response.statusCode == 200) {
      print("Response received");

      if (response.body is Map<String, dynamic>) {
        print(" one doneeeeeee");
        final data = response.body['data'];

        if (data is Map<String, dynamic>) {
          print(" two doneeeeeee");
          final profiles = data['data'] as List;

          final userProfile = profiles.firstWhere(
            (profile) => profile['user_id'] == userId,
            orElse: () => null,
          );

          if (userProfile != null) {
            print("Profile found");
            print(userProfile['id']);
            storage.write("profile_id", userProfile['id']);
            return ProfileResponseModel.fromJson(userProfile);
          }
        }
      }
    }

    return null;
  }

  // Create Profile
  Future<Response> createProfile(ProfileModel profile) async {
    await tokenController.refreshToken();
    print("in createProfile provider");
    return await post(
      'http://myblog.mobaen.com/api/profiles',
      profile.toJson(),
      contentType: "application/json",
      headers: {
        'Authorization': 'Bearer ${storage.read("jwt_token")}',
      },
    );
  }

  // Update Profile
  Future<Response> updateProfile(int id, ProfileModel profile) async {
    await tokenController.refreshToken();
    return put(
      'http://myblog.mobaen.com/api/profiles/$id',
      profile.toJson(),
      contentType: "application/json",
      headers: {
        'Authorization': 'Bearer ${storage.read("jwt_token")}',
      },
    );
  }

  Future<List<LikePost>> fetchLikedPosts() async {
    await tokenController.refreshToken();

    final response = await get(
      'http://myblog.mobaen.com/api/likes',
      headers: {'Authorization': 'Bearer ${storage.read("jwt_token")}'},
    );

    if (response.statusCode == 200) {
      final data = response.body['data']['data'];

      return List<LikePost>.from(data.map((item) => LikePost.fromJson(item)));
    } else {
      throw Exception('Failed to load liked posts');
    }
  }

  Future<List<LikePost>> fetchSavePosts() async {
    await tokenController.refreshToken();

    final response = await get(
      'http://myblog.mobaen.com/api/favorites',
      headers: {'Authorization': 'Bearer ${storage.read("jwt_token")}'},
    );

    if (response.statusCode == 200) {
      final data = response.body['data']['data'];

      return List<LikePost>.from(data.map((item) => LikePost.fromJson(item)));
    } else {
      throw Exception('Failed to load liked posts');
    }
  }
}
