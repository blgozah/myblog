import 'package:get/get.dart';
import 'dart:convert';
import 'dart:io';

class PostCreateModel {
  final String title;
  final String content;
  final File? image;

  PostCreateModel({
    required this.title,
    required this.content,
    this.image,
  });

  String? base64EncodeImage(File? image) {
    if (image == null) {
      return null;
    }
    List<int> imageBytes = image.readAsBytesSync();
    return base64Encode(imageBytes);
  }

  FormData toFormData() {
    final formData = FormData({
      'title': title,
      'content': content,
    });

    if (image != null) {
      formData.files.add(
        MapEntry(
          'image',
          MultipartFile(
            image!,
            filename: image!.path.split('/').last,
          ),
        ),
      );
    }

    return formData;
  }
}
