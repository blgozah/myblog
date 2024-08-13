import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myblog/app/modules/create_post/controllers/create_post_controller.dart';
import 'package:myblog/app/modules/create_post/model/post_create_model.dart';
import 'package:image_picker/image_picker.dart';

class CreatePostView extends StatelessWidget {
  final PostController controller = Get.find<PostController>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  CreatePostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('إنشاء منشور'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'العنوان'),
            ),
            TextField(
              controller: contentController,
              decoration: InputDecoration(labelText: 'المحتوى'),
            ),
            SizedBox(height: 20),
            Obx(() => controller.selectedImage.value != null
                ? Image.file(controller.selectedImage.value!)
                : Text('لم يتم اختيار صورة')),
            ElevatedButton.icon(
              icon: Icon(Icons.camera_alt),
              label: Text('اختر صورة'),
              onPressed: () => controller.pickImage(ImageSource.gallery),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('إنشاء منشور'),
              onPressed: () {
                final post = PostCreateModel(
                  title: titleController.text,
                  content: contentController.text,
                  image: controller.selectedImage.value,
                );
                controller.createPosts(post);
                print(post.image);
              },
            ),
          ],
        ),
      ),
    );
  }
}
