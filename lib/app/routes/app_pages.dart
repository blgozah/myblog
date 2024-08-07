import 'package:get/get.dart';
import 'package:myblog/app/modules/auth/views/verify_phone_view.dart';

import '../modules/auth/bindings/bindings.dart';
import '../modules/auth/views/views.dart';
import '../modules/home/bindings/bindings.dart';
import '../modules/home/views/views.dart';
import '../modules/onboarding/bindings/bindings.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/splash/bindings/bindings.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    // Home
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    // Auth
    GetPage(
      name: _Paths.SIGNIN,
      page: () => const SigninView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.PHONE_VERIFICATION,
      page: () => VerifyPhoneView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
  ];
}
