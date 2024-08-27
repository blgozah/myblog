import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myblog/app/modules/profile/controllers/profile_controller.dart';
import 'package:myblog/app/modules/profile/model/profile_model.dart';
import 'package:myblog/app/modules/profile/model/profile_response_model.dart';
import 'package:myblog/app/modules/profile/views/followers_list_page.dart';
import 'package:myblog/app/modules/profile/views/liked_posts_page.dart';
import 'package:myblog/app/modules/profile/views/saved_posts_page.dart';
import 'package:myblog/app/modules/profile/views/user_post_page.dart';
import 'package:myblog/app/routes/app_pages.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final ProfileController controller = Get.find<ProfileController>();
  final storage = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('الملف الشخصي'),
      //   backgroundColor: Colors.blueAccent,
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.edit, color: Colors.white),
      //       onPressed: () {
      //         Get.to(() => EditProfilePage());
      //       },
      //     ),
      //   ],
      // ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ProfileDetailsPage(profile: controller.profileResponse.value);
        }
      }),
    );
  }
}

class ProfileDetailsPage extends StatelessWidget {
  final ProfileResponseModel? profile;
  final storage = GetStorage();
  ProfileDetailsPage({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('الملف الشخصي'),
        backgroundColor: Colors.blueAccent,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'signOut') {
                // Sign out logic here
                storage.erase();
                Get.offAllNamed(
                    Routes.SIGNIN); // Replace with your sign-in page route
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'signOut',
                child: Text('تسجيل الخروج'),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          // Profile Info Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey.shade300,
                  child: profile == null
                      ? const Icon(Icons.person, size: 30, color: Colors.white)
                      : null,
                ),
                const SizedBox(height: 16),
                if (profile != null) ...[
                  Text(
                    profile!.username,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    profile!.name,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    profile!.email,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w300),
                  ),
                ] else ...[
                  ElevatedButton(
                    onPressed: () {
                      Get.to(() => CreateProfilePage());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'إنشاء الملف الشخصي',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.people_alt,
                              color: Colors.blueAccent),
                          onPressed: () {
                            Get.to(() => FollowersListPage());
                          },
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${controller.followerProfiles.length} متابع',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Tab Bar
          Expanded(
            child: DefaultTabController(
              length: 3,
              child: Column(
                children: const [
                  TabBar(
                    tabs: [
                      Tab(text: 'المنشورات'),
                      Tab(text: 'المحفوظات'),
                      Tab(text: 'الإعجابات'),
                    ],
                    indicatorColor: Colors.blueAccent,
                    labelColor: Colors.blueAccent,
                    unselectedLabelColor: Colors.black,
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        UserPostsPage(),
                        SavedPostsPage(),
                        LikedPostsPage(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CreateProfilePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  CreateProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('إنشاء ملف شخصي'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextField('اسم المستخدم', usernameController, Icons.person),
              const SizedBox(height: 20),
              _buildTextField('الاسم', nameController, Icons.person),
              const SizedBox(height: 20),
              _buildTextField(
                  'البريد الإلكتروني', emailController, Icons.email),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final newProfile = ProfileModel(
                      username: usernameController.text,
                      name: nameController.text,
                      email: emailController.text,
                    );
                    controller.createProfile(newProfile);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'إنشاء الملف الشخصي',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label, TextEditingController controller, IconData icon) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.blueAccent),
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'يرجى إدخال $label';
        }
        return null;
      },
    );
  }
}

class EditProfilePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.find();
    final profile = controller.profile.value;

    if (profile != null) {
      _nameController.text = profile.name;
      _emailController.text = profile.email;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('تعديل الملف الشخصي'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextField('الاسم', _nameController, Icons.badge),
              const SizedBox(height: 20),
              _buildTextField(
                  'البريد الإلكتروني', _emailController, Icons.email),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final updatedProfile = ProfileModel(
                      username: profile?.username ?? '',
                      name: _nameController.text,
                      email: _emailController.text,
                    );
                    controller.updateProfile(1, updatedProfile);
                    Get.back();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'حفظ التغييرات',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label, TextEditingController controller, IconData icon) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.blueAccent),
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'يرجى إدخال $label';
        }
        return null;
      },
    );
  }
}
