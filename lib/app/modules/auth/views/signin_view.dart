import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:myblog/app/modules/auth/controllers/controllers.dart';
import 'package:myblog/app/routes/routes.dart';

class SigninView extends GetView<AuthController> {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF00C6FF), Color(0xFF0072FF)],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(24.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10.0,
                  ),
                ],
              ),
              width: 300.w,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'مرحباً',
                      style: TextStyle(
                        fontSize: 40.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'تسجيل الدخول',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  TextFormField(
                    controller: controller.phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: 'رقم الجوال',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 12.h,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'هذا الحقل مطلوب';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.h),
                  Obx(
                    () => TextFormField(
                      controller: controller.passwordController,
                      decoration: InputDecoration(
                        hintText: 'كلمة المرور',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 12.h,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.isPasswordVisible.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: controller.togglePasswordVisibility,
                        ),
                      ),
                      obscureText: !controller.isPasswordVisible.value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'كلمة المرور مطلوبة';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 16.h),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'نسيت كلمة المرور؟',
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Obx(
                    () => SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: controller.isLoading.value
                            ? null
                            : () {
                                controller.signin();
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 40.w,
                            vertical: 12.h,
                          ),
                        ),
                        child: Text(
                          controller.isLoading.value
                              ? 'يرجى الانتظار...'
                              : 'تسجيل الدخول',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Get.offAllNamed(Routes.SIGNUP);
                      },
                      child: Text(
                        'إنشاء حساب جديد',
                        style: TextStyle(fontSize: 14.sp),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
