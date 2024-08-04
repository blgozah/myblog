import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myblog/app/routes/routes.dart';

class OnboardingController extends GetxController {
  final storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    if(storage.read("is_displaying_onboarding") == false)
    {
      Get.offAllNamed(Routes.SIGNIN);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void finished(){
    storage.write("is_displaying_onboarding", false);
    Get.offAllNamed(Routes.SIGNIN);
  }

}
