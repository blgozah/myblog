import 'package:get/get.dart';

import 'package:myblog/app/modules/splash/controllers/controllers.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<SplashController>(
    //   () => SplashController(),
    // );
    Get.put(SplashController());
  }
}
