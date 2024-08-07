import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myblog/app/routes/routes.dart';

class SplashController extends GetxController {
  final storage = GetStorage();

  // final count = 0.obs;

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(Routes.ONBOARDING);
    });
  }

  // void increment() => count.value++;
}
