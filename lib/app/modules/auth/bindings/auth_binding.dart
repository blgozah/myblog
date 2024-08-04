import 'package:get/get.dart';
import 'package:myblog/app/modules/auth/providers/providers.dart';

import '../controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
      () => AuthController(),
    );
    Get.lazyPut<SigninProvider>(
      () => SigninProvider(),
    );
  }
}
