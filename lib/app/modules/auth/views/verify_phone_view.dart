import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myblog/app/modules/auth/controllers/verify_phone_controller.dart';

class VerifyPhoneView extends StatelessWidget {
  const VerifyPhoneView({super.key});

  @override
  Widget build(BuildContext context) {
    final VerifyPhoneController controller = Get.put(VerifyPhoneController());

    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0,
              ),
            ],
          ),
          width: 300.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'تحقق من رقم الهاتف',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                'أدخل الرمز المكون من 6 أرقام الذي تلقيته على رقم هاتفك',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              // OtpInputField(controller: controller.codeController),
              TextFormField(
                controller: controller.codeController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'رقم الكود',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'هذا الحقل مطلوب';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Obx(() => ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                    ),
                    onPressed: controller.isLoading.value
                        ? null
                        : controller.verifyPhone,
                    child: controller.isLoading.value
                        ? CircularProgressIndicator()
                        : Text('تحقق',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18)),
                  )),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {},
                child: Text('إعادة إرسال الرمز'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OtpInputField extends StatelessWidget {
  final TextEditingController controller;
  final int length;

  const OtpInputField({super.key, required this.controller, this.length = 6});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(length, (index) {
        return SizedBox(
          width: 40,
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 1,
            decoration: InputDecoration(
              counterText: '',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        );
      }),
    );
  }
}
