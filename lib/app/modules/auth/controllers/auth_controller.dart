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

  final RxBool _isLoading = false.obs;

  var isPasswordVisible = false.obs;
  final passwordController = TextEditingController();

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  get isLoading => _isLoading;

  @override
  void onInit() {
    super.onInit();

    print("Helloooooooooooooooooooooo "+storage.read("is_displaying_onboarding").toString());
    if (storage.read("is_signedin") == true) {
      Get.offAllNamed(Routes.HOME);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    phoneController.dispose();
    passwordController.dispose();
    //
    super.onClose();
  }

  void signin() {
    SigninRequestModel signinModel = SigninRequestModel(
        phone: phoneController.text, password: passwordController.text);
    provider.postSignin(signinModel).then((response) {
      if (response.isOk) {
        // Successfully received response
        // print('Response data: ${response.body?.token}');
        storage.write("jwt_token", response.body?.token);
        storage.write("is_signedin", true);
        Get.offAllNamed(Routes.HOME);
      } else {
        // Handle error
        Get.snackbar('Error', response.body?.message ?? 'Unknown error');
      }
    }).catchError((error) {
      Get.snackbar('Error', error.toString());
    });
    
  }
}
