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
              page: () => ProfilePage(),
            );
          }
          return null;
        },
      ),
      bottomNavigationBar: CustomBottomNavBar(),
      floatingActionButton: Container(
        width: 56,
        height: 56,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF00C6FF), Color(0xFF0072FF)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
          shape: BoxShape.circle,
        ),
        child: FloatingActionButton(
          onPressed: () {
            Get.toNamed(Routes.CREATE_POST);
          },
          backgroundColor: Colors
              .transparent, // Set to transparent to use gradient background
          elevation: 0,
          child: Icon(Icons.add,
              color: Colors
                  .white), // Remove elevation to ensure gradient background is visible
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
