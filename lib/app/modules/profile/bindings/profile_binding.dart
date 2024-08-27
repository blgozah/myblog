import 'package:get/get.dart';
import 'package:myblog/app/modules/auth/controllers/refresh_token.dart';
import 'package:myblog/app/modules/home/controllers/post_controller.dart';
import 'package:myblog/app/modules/home/providers/post_provider.dart';
import 'package:myblog/app/modules/profile/controllers/profile_controller.dart';
import 'package:myblog/app/modules/profile/provider/profile_provider.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    print('ProfileBinding is being executed');
    Get.lazyPut<ProfileController>(() =>
        ProfileController(HomeProvider(), profileProvider: ProfileProvider()));
    Get.put(RefreshTokenController());
    Get.put(HomeController());
  }
}
