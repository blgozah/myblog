import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myblog/app/modules/auth/models/models.dart';
import 'package:myblog/app/modules/auth/providers/signup_provider.dart';
import 'package:myblog/app/routes/routes.dart';

class SignupController extends GetxController {
  final SignupProvider provider = Get.find<SignupProvider>();
  final storage = GetStorage();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;
  final RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  void signup() async {
    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar('Error', 'كلمتا المرور غير متطابقتين');
      return;
    }

    _isLoading.value = true;
    final signupModel = SignupRequestModel(
      phone: phoneController.text,
      password: passwordController.text,
      passwordConformation: confirmPasswordController.text,
    );

    try {
      print("hiiiiiii");
      final response = await provider.postSignup(signupModel);
      if (response.isOk) {
        print("okkkkkkkkkkk");
        final data = response.body;
        storage.write("phone", data?.phone);
        Get.toNamed(Routes.PHONE_VERIFICATION);
      } else {
        Get.snackbar('Error', response.body?.message ?? 'Unknown error');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred. Please try again.');
    } finally {
      _isLoading.value = false;
    }
  }

  @override
  void onClose() {
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
