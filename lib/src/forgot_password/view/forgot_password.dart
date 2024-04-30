import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_home_safe/src/login/view/login_page.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_textformfiled.dart';
import '../controller/forgot_password_controller.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
          init: ForgotPassordController(),
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Form(
                key: controller.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Forgot Password?',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 30),
                    CustomTextFormFiled(
                      controller: controller.forgot,
                      textInputType: TextInputType.emailAddress,
                      hint: 'E-mails',
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please write your e-mail';
                        } else {
                          return null;
                        }
                      }
                    ),
                    CustomButton(
                        text: 'Send',
                        onPressed: () {
                         if(controller.formKey.currentState!.validate()){
                            controller.sendEmail();
                          Get.offAll(()=>LoginPage());
                         }
                        }),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
