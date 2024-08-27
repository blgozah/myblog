import 'package:get/get.dart';
import 'package:myblog/app/modules/home/models/post.dart';
import 'package:myblog/app/modules/home/providers/post_provider.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;
  var posts = <Post>[].obs;
  var likedPosts = <int>[].obs;
  var favoritePosts = <int>[].obs;
  var followedUsers = <int>[].obs;

  final HomeProvider provider = HomeProvider();

  @override
  void onInit() {
    fetchInitialData();
    super.onInit();
  }

  void fetchInitialData() async {
    try {
      isLoading(true);
      await fetchPosts();
      await fetchLikes();
      await fetchFavorites();
      await fetchFollows();
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchPosts() async {
    try {
      var postsResult = await provider.fetchPosts();
      posts.assignAll(postsResult);
    } catch (e) {
      print("Failed to load posts: $e");
    }
  }

  Future<void> fetchLikes() async {
    try {
      var likesResult = await provider.fetchLikes();
      likedPosts.assignAll(likesResult);
    } catch (e) {
      print("Failed to load likes: $e");
    }
  }

  Future<void> fetchFavorites() async {
    try {
      var favoritesResult = await provider.fetchFavorites();
      favoritePosts.assignAll(favoritesResult);
    } catch (e) {
      print("Failed to load favorites: $e");
    }
  }

  Future<void> fetchFollows() async {
    try {
      var followsResult = await provider.fetchFollows();
      followedUsers.assignAll(followsResult);
    } catch (e) {
      print("Failed to load follows: $e");
    }
  }

  void likePost(int id) async {
    try {
      await provider.likePost(id);
      //post.isLiked = true;
      posts.refresh();
      if (!likedPosts.contains(id)) {
        likedPosts.add(id);
      }
    } catch (e) {
      // Handle error
    }
  }

  void unlikePost(int id) async {
    try {
      await provider.unlikePost(id);
      // post.isLiked = false;
      posts.refresh();
      likedPosts.remove(id);
    } catch (e) {
      // Handle error
    }
  }

  void savePost(int id) async {
    try {
      await provider.savePost(id);
      //post.isSaved = true;
      posts.refresh();
      if (!favoritePosts.contains(id)) {
        favoritePosts.add(id);
      }
    } catch (e) {
      // Handle error
    }
  }

  void unsavePost(int id) async {
    try {
      await provider.unsavePost(id);
      // post.isSaved = false;
      posts.refresh();
      favoritePosts.remove(id);
    } catch (e) {
      // Handle error
    }
  }

  void followUser(int id) async {
    try {
      await provider.follow(id);
      // post.user.isFollowed = true;
      posts.refresh();
      if (!followedUsers.contains(id)) {
        followedUsers.add(id);
      }
    } catch (e) {
      // Handle error
    }
  }

  void unfollowUser(int id) async {
    try {
      await provider.unfollow(id);
      // post.user.isFollowed = false;
      posts.refresh();
      followedUsers.remove(id);
    } catch (e) {
      // Handle error
    }
  }

  bool isPostLiked(int postId) => likedPosts.contains(postId);

  bool isPostFavorited(int postId) => favoritePosts.contains(postId);

  bool isUserFollowed(int userId) => followedUsers.contains(userId);
}
