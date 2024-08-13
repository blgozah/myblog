import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myblog/app/modules/splash/bindings/splash_binding.dart';
import 'package:myblog/app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyBlog());
}

class MyBlog extends StatelessWidget {
  const MyBlog({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          textDirection: TextDirection.rtl,
          title: "My Blog",
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          initialBinding: SplashBinding(),
        );
      },
    );
  }
}
