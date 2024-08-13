import 'package:get/get.dart';
import 'package:myblog/app/modules/home/models/post.dart';
import 'package:myblog/app/modules/home/providers/post_provider.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;
  var posts = <Post>[].obs;

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  void fetchPosts() async {
    try {
      isLoading(true);
      var postsResult = await HomeProvider().fetchPosts();
      posts.assignAll(postsResult);
    } finally {
      isLoading(false);
    }
  }
}
