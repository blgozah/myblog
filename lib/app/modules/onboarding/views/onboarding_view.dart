import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            const Center(
              child: Text(
                'OnboardingView is working',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Center(
              child: IconButton(
                onPressed: () {
                  controller.finished();
                },
                icon: const Icon(
                  Icons.home,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
