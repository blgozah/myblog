import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myblog/app/modules/auth/controllers/controllers.dart';

class SigninView extends GetView<AuthController> {
  const SigninView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 150,
              ),
              const Center(
                child: Text(
                  'تسجيل الدخول',
                  style: TextStyle(fontSize: 35),
                ),
              ),
              const SizedBox(height: 30),
              // PhoneNumber Field
              // const Text(
              //   "رقم الجوال",
              //   style: TextStyle(
              //     color: Color(0xff895575),
              //     fontSize: 18,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              TextFormField(
                controller: controller.phoneController,
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 1,
                // keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'رقم الجوال',
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xffd9d9d9), width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(6.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffd9d9d9), width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(6.0))),
                  hintText: '',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'هذا الحقل مطلوب';
                  }
                },
              ),
              const SizedBox(
                height: 15,
              ),
              Obx(
                () => TextFormField(
                  controller: controller.passwordController,
                  decoration: InputDecoration(
                    labelText: 'كلمة المرور',
                    fillColor: Colors.white,
                  filled: true,
                    border: const OutlineInputBorder(),
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
              const SizedBox(
                height: 15,
              ),
              // SignIn Button
              Center(
                child: Card(
                  // color: Color(0xffe33e6f),
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: ListTile(
                    title: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "دخــول",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xffffffff),
                            fontSize: 22,
                            letterSpacing: 0.1,
                          ),
                        )
                      ],
                    ),
                    onTap: () {
                      controller.signin();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
