import 'package:flutter/material.dart';

import 'package:get/get.dart';

class PhoneVerificationView extends GetView {
  const PhoneVerificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PhoneVerificationView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PhoneVerificationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
