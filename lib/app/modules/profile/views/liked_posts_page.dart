import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myblog/app/modules/home/providers/post_provider.dart';
import 'package:myblog/app/modules/home/views/home_view.dart';
import 'package:myblog/app/modules/profile/controllers/profile_controller.dart';
import 'package:myblog/app/modules/profile/model/liked_posts.dart';
import 'package:myblog/app/modules/profile/provider/profile_provider.dart';

class LikedPostsPage extends StatelessWidget {
  const LikedPostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text('المنشورات المفضلة')),
      body: GetX<ProfileController>(
        init: ProfileController(HomeProvider(),
            profileProvider: ProfileProvider()),
        builder: (controller) {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: controller.likedPosts.length,
            itemBuilder: (context, index) {
              LikePost post = controller.likedPosts[index];
              return LikePostCard(post: post);
            },
          );
        },
      ),
    );
  }
}
