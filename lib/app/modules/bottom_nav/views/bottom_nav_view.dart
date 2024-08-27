import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myblog/app/modules/bottom_nav/controllers/bottom_nav_controller.dart';
import 'package:myblog/app/routes/app_pages.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavController>(
      builder: (controller) {
        return BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: (index) {
            controller.changePage(index);
            if (index == 0) {
              Get.toNamed(Routes.HOME);
            } else if (index == 2) {
              Get.toNamed(Routes.PROFILE);
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Create',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        );
      },
    );
  }
}
