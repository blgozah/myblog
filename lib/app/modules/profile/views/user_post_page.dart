import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myblog/app/modules/home/models/post.dart';
import 'package:myblog/app/modules/home/providers/post_provider.dart';
import 'package:myblog/app/modules/home/views/home_view.dart';
import 'package:myblog/app/modules/profile/controllers/profile_controller.dart';
import 'package:myblog/app/modules/profile/provider/profile_provider.dart';

class UserPostsPage extends StatelessWidget {
  const UserPostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text('منشورات المستخدم')),
      body: GetX<ProfileController>(
        init: ProfileController(HomeProvider(),
            profileProvider: ProfileProvider()),
        builder: (controller) {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: controller.posts.length,
            itemBuilder: (context, index) {
              Post post = controller.posts[index];
              return PostCard(post: post);
            },
          );
        },
      ),
    );
  }
}
