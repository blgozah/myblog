import 'dart:io';

class PostCreateModel {
  String title;
  String content;
  File? image;

  PostCreateModel({this.image, required this.title, required this.content});
}
