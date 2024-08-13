import 'package:get/get.dart';
import 'package:myblog/app/modules/auth/controllers/refresh_token.dart';
import 'package:myblog/app/modules/auth/providers/providers.dart';
import 'package:myblog/app/modules/auth/providers/refresh_provider.dart';

import '../controllers/controllers.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SigninProvider>(
      () => SigninProvider(),
    );

    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<SignupProvider>(() => SignupProvider());
    Get.lazyPut<SignupController>(() => SignupController());
    Get.lazyPut<VerifyPhoneProvider>(() => VerifyPhoneProvider());
    Get.put(RefreshTokenController());
  }
}
