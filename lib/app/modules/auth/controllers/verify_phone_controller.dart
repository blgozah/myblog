import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myblog/app/modules/auth/providers/verify_phone_provider.dart';
import 'package:myblog/app/routes/app_pages.dart';

class VerifyPhoneController extends GetxController {
  final VerifyPhoneProvider provider = Get.find<VerifyPhoneProvider>();
  final TextEditingController codeController = TextEditingController();
  final storge = GetStorage();

  final RxBool isLoading = false.obs;

  @override
  void onClose() {
    codeController.dispose();
    super.onClose();
  }

  Future<void> verifyPhone() async {
    isLoading.value = true;
    try {
      final response = await provider.postVerifyPhone(
          storge.read("phone"), codeController.text);
      if (response.isOk && response.body?.status == true) {
        Get.snackbar(
            'Success', response.body?.message ?? 'Phone number verified');
        Get.toNamed(Routes.SIGNIN);
      } else {
        Get.snackbar('Error', response.body?.message ?? 'Verification failed');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred. Please try again.');
    } finally {
      isLoading.value = false;
    }
  }
}
