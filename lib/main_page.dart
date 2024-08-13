import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myblog/app/modules/bottom_nav/views/bottom_nav_view.dart';
import 'package:myblog/app/modules/create_post/views/create_post_view.dart';
import 'package:myblog/app/modules/home/views/home_view.dart';
import 'package:myblog/app/modules/profile/views/profile_view.dart';
import 'package:myblog/app/routes/app_pages.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: Get.nestedKey(1),
        initialRoute: Routes.HOME,
        onGenerateRoute: (settings) {
          if (settings.name == Routes.HOME) {
            return GetPageRoute(
              settings: settings,
              page: () => HomeView(),
            );
          } else if (settings.name == Routes.CREATE_POST) {
            return GetPageRoute(
              settings: settings,
              page: () => CreatePostView(),
            );
          } else if (settings.name == Routes.PROFILE) {
            return GetPageRoute(
              settings: settings,
              page: () => ProfileView(),
            );
          }
          return null;
        },
      ),
      bottomNavigationBar: CustomBottomNavBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.CREATE_POST); // Navigate to CreatePostView
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
