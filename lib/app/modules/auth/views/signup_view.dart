import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:myblog/app/modules/auth/controllers/controllers.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});

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
            child: SingleChildScrollView(
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
                        'إنشاء حساب جديد',
                        style: TextStyle(
                          fontSize: 40.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    _buildTextField('رقم الجوال', controller.phoneController,
                        keyboardType: TextInputType.phone),
                    SizedBox(height: 16.h),
                    _buildPasswordField(
                        'كلمة المرور',
                        controller.passwordController,
                        controller.isPasswordVisible),
                    SizedBox(height: 16.h),
                    _buildPasswordField(
                        'تأكيد كلمة المرور',
                        controller.confirmPasswordController,
                        controller.isConfirmPasswordVisible),
                    SizedBox(height: 16.h),
                    Obx(
                      () => SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed:
                              controller.isLoading ? null : controller.signup,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 40.w, vertical: 12.h),
                          ),
                          child: controller.isLoading
                              ? CircularProgressIndicator(color: Colors.white)
                              : Text(
                                  'إنشاء حساب',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 20),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String labelText, TextEditingController controller,
      {TextInputType keyboardType = TextInputType.text}) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r)),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      ),
      validator: (value) =>
          (value == null || value.isEmpty) ? 'هذا الحقل مطلوب' : null,
    );
  }

  Widget _buildPasswordField(String labelText, TextEditingController controller,
      RxBool isPasswordVisible) {
    return Obx(
      () => TextFormField(
        controller: controller,
        obscureText: !isPasswordVisible.value,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r)),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          suffixIcon: IconButton(
            icon: Icon(isPasswordVisible.value
                ? Icons.visibility
                : Icons.visibility_off),
            onPressed: () => isPasswordVisible.value = !isPasswordVisible.value,
          ),
        ),
        validator: (value) =>
            (value == null || value.isEmpty) ? 'هذا الحقل مطلوب' : null,
      ),
    );
  }
}
