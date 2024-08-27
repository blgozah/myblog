import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';

class PostCreateModel {
  final String title;
  final String content;
  //final File? image;

  PostCreateModel({
    required this.title,
    required this.content,
    // required this.image,
  });
  String? base64EncodeImage(File? image) {
    if (image == null) {
      return null;
    }

    List<int> imageBytes = image.readAsBytesSync();
    return base64Encode(imageBytes);
  }

  // Map<String, dynamic> toJson() =>
  //     {'title': title, 'content': content, 'image': base64EncodeImage(image)};
}
