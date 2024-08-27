import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:myblog/app/modules/home/controllers/post_controller.dart';
import 'package:myblog/app/modules/home/models/post.dart';
import 'package:myblog/app/modules/profile/model/liked_posts.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الرئيسية')),
      body: GetX<HomeController>(
        init: HomeController(),
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

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();

    return Padding(
      padding: EdgeInsets.all(8.0.w),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(10.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 25.r,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 40.sp,
                    ),
                  ),
                  SizedBox(width: 10.0.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.user.profile?.name ??
                              'None', // Handle null profile
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(height: 5.0.h),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.isUserFollowed(post.user.id)
                          ? controller.unfollowUser(post.user.id)
                          : controller.followUser(post.user.id);
                    },
                    child: Text(controller.isUserFollowed(post.user.id)
                        ? 'Unfollow'
                        : 'Follow'),
                  ),
                ],
              ),
              SizedBox(height: 10.0.h),
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'http://myblog.mobaen.com/storage/public/${post.image}'),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 200.0.h,
                width: double.infinity,
              ),
              SizedBox(height: 10.0.h),
              Text(
                post.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(height: 5.0.h),
              Text(
                post.content,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 5.0.h),
              Text(
                post.createdAt,
                style: const TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 10.0.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      controller.isPostLiked(post.id)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: controller.isPostLiked(post.id)
                          ? Colors.red
                          : Colors.grey,
                    ),
                    onPressed: () {
                      controller.isPostLiked(post.id)
                          ? controller.unlikePost(post.id)
                          : controller.likePost(post.id);
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      controller.isPostFavorited(post.id)
                          ? Icons.bookmark
                          : Icons.bookmark_border,
                      color: controller.isPostFavorited(post.id)
                          ? Colors.blue
                          : Colors.grey,
                    ),
                    onPressed: () {
                      controller.isPostFavorited(post.id)
                          ? controller.unsavePost(post.id)
                          : controller.savePost(post.id);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LikePostCard extends StatelessWidget {
  final LikePost post;

  const LikePostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();

    return Padding(
      padding: EdgeInsets.all(8.0.w),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(10.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 25.r,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 40.sp,
                    ),
                  ),
                  SizedBox(width: 10.0.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'None', // Handle null profile
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(height: 5.0.h),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.isUserFollowed(post.pivot.userId)
                          ? controller.unfollowUser(post.pivot.userId)
                          : controller.followUser(post.pivot.userId);
                    },
                    child: Text(controller.isUserFollowed(post.pivot.userId)
                        ? 'Unfollow'
                        : 'Follow'),
                  ),
                ],
              ),
              SizedBox(height: 10.0.h),
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'http://myblog.mobaen.com/storage/public/${post.image}'),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 200.0.h,
                width: double.infinity,
              ),
              SizedBox(height: 10.0.h),
              Text(
                post.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(height: 5.0.h),
              Text(
                post.content,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 5.0.h),
              Text(
                post.createdAt,
                style: const TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 10.0.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      controller.isPostLiked(post.id)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: controller.isPostLiked(post.id)
                          ? Colors.red
                          : Colors.grey,
                    ),
                    onPressed: () {
                      controller.isPostLiked(post.id)
                          ? controller.unlikePost(post.id)
                          : controller.likePost(post.id);
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      controller.isPostFavorited(post.id)
                          ? Icons.bookmark
                          : Icons.bookmark_border,
                      color: controller.isPostFavorited(post.id)
                          ? Colors.blue
                          : Colors.grey,
                    ),
                    onPressed: () {
                      controller.isPostFavorited(post.id)
                          ? controller.unsavePost(post.id)
                          : controller.savePost(post.id);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
