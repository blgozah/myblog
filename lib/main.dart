import 'package:flutter/material.dart';
import 'package:myblog/src/view/screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'My Blog',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
