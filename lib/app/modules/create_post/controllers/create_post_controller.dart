import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:myblog/app/modules/create_post/provider/create_post_provider.dart';

class PostController extends GetxController {
  var title = ''.obs;
  var content = ''.obs;
  var image = Rxn<File>();

  final ImagePicker _picker = ImagePicker();
  final PostProvider postProvider;

  PostController({required this.postProvider});
  void pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image.value = File(pickedFile.path);
    }
  }

  Future<void> submitPost() async {
    if (title.value.isEmpty || content.value.isEmpty) {
      Get.snackbar('Error', 'Title and content cannot be empty');
      return;
    }

    try {
      FormData formData = FormData({
        'title': title.value,
        'content': content.value,
        if (image.value != null)
          'photo': MultipartFile(image.value!,
              filename: image.value!.path.split('/').last),
      });

      final response = await postProvider.createPost(formData);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar('Success', 'Post created successfully');
      } else {
        Get.snackbar('Error', 'Failed to create post: ${response.statusText}');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    }
  }
}
