import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myblog/app/modules/auth/controllers/refresh_token.dart';
import 'package:myblog/app/modules/home/models/post.dart';

class HomeProvider extends GetConnect {
  final storage = GetStorage();
  final RefreshTokenController tokenController = Get.find();

  Future<List<Post>> fetchPosts() async {
    await tokenController.refreshToken();
    final response = await get(
      'http://myblog.mobaen.com/api/posts',
      headers: {'Authorization': 'Bearer ${storage.read("jwt_token")}'},
    );
    if (response.statusCode == 200) {
      final data = response.body['data']['data'];
      return List<Post>.from(data.map((item) => Post.fromJson(item)));
    } else {
      throw Exception('Failed to load posts');
    }
  }

  Future<List<int>> fetchLikes() async {
    await tokenController.refreshToken();
    final response = await get(
      'http://myblog.mobaen.com/api/likes',
      headers: {'Authorization': 'Bearer ${storage.read("jwt_token")}'},
    );
    if (response.statusCode == 200) {
      final data = response.body['data']['data'];
      return List<int>.from(data.map((item) => item['pivot']['post_id']));
    } else {
      throw Exception('Failed to load likes');
    }
  }

  Future<List<int>> fetchFavorites() async {
    await tokenController.refreshToken();
    final response = await get(
      'http://myblog.mobaen.com/api/favorites',
      headers: {'Authorization': 'Bearer ${storage.read("jwt_token")}'},
    );
    if (response.statusCode == 200) {
      final data = response.body['data']['data'];
      return List<int>.from(data.map((item) => item['pivot']['post_id']));
    } else {
      throw Exception('Failed to load favorites');
    }
  }

  Future<List<int>> fetchFollows() async {
    await tokenController.refreshToken();
    final response = await get(
      'http://myblog.mobaen.com/api/follows',
      headers: {'Authorization': 'Bearer ${storage.read("jwt_token")}'},
    );
    if (response.statusCode == 200) {
      final data = response.body['data']['data'];
      return List<int>.from(data.map((item) => item['pivot']['followed_id']));
    } else {
      throw Exception('Failed to load follows');
    }
  }

  Future<Response> likePost(int postId) async {
    await tokenController.refreshToken();
    return await post(
      'http://myblog.mobaen.com/api/likes',
      {'post_id': postId},
      contentType: "application/json",
      headers: {'Authorization': 'Bearer ${storage.read("jwt_token")}'},
    );
  }

  Future<Response> unlikePost(int postId) async {
    await tokenController.refreshToken();
    return await delete(
      'http://myblog.mobaen.com/api/likes/$postId',
      contentType: "application/json",
      headers: {'Authorization': 'Bearer ${storage.read("jwt_token")}'},
    );
  }

  Future<Response> savePost(int postId) async {
    await tokenController.refreshToken();
    return await post(
      'http://myblog.mobaen.com/api/favorites',
      {'post_id': postId},
      contentType: "application/json",
      headers: {'Authorization': 'Bearer ${storage.read("jwt_token")}'},
    );
  }

  Future<Response> unsavePost(int postId) async {
    await tokenController.refreshToken();
    return await delete(
      'http://myblog.mobaen.com/api/favorites/$postId',
      contentType: "application/json",
      headers: {'Authorization': 'Bearer ${storage.read("jwt_token")}'},
    );
  }

  Future<Response> follow(int userId) async {
    await tokenController.refreshToken();
    return await post(
      'http://myblog.mobaen.com/api/follows',
      {'user_id': userId},
      contentType: "application/json",
      headers: {'Authorization': 'Bearer ${storage.read("jwt_token")}'},
    );
  }

  Future<Response> unfollow(int userId) async {
    await tokenController.refreshToken();
    return await delete(
      'http://myblog.mobaen.com/api/follows/$userId',
      contentType: "application/json",
      headers: {'Authorization': 'Bearer ${storage.read("jwt_token")}'},
    );
  }
}
