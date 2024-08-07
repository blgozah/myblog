import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myblog/app/modules/auth/models/models.dart';
import 'package:myblog/app/modules/auth/providers/signin_provider.dart';
import 'package:myblog/app/routes/routes.dart';

class AuthController extends GetxController {
  final storage = GetStorage();
  final provider = Get.find<SigninProvider>();

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  var isLoading = false.obs;
  var isPasswordVisible = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  @override
  void onInit() {
    super.onInit();
    if (storage.read("is_signedin") == true) {
      Get.offAllNamed(Routes.HOME);
    }
  }

  @override
  void onClose() {
    phoneController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void signin() async {
    isLoading.value = true;
    try {
      SigninRequestModel signinModel = SigninRequestModel(
          phone: phoneController.text, password: passwordController.text);
      final response = await provider.postSignin(signinModel);
      if (response.isOk) {
        final data = response.body;
        storage.write("jwt_token", data?.token);
        storage.write("is_signedin", true);
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.snackbar('Error', response.body?.message ?? 'Unknown error');
      }
    } catch (error) {
      Get.snackbar('Error', error.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
