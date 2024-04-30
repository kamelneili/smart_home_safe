import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home_safe/service/remote/auth_controller.dart';
import 'package:smart_home_safe/src/homepage/view/homepage.dart';
import 'package:smart_home_safe/src/login/controller/login_controller.dart';

import '../../forgot_password/view/forgot_password.dart';
import '../../sign_up/view/sign_up.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textformfiled.dart';

class LoginPage extends StatelessWidget {
    LoginPage({super.key});
    final controllerEmail = TextEditingController();
    final controllerPassword = TextEditingController();
      final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<AuthController>(
          init: AuthController(),
          builder: (controller) => Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child:ListView(
          children:[ Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Text(
                  'Login',
                  style:
                      GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
                )),
                const SizedBox(height: 20),
                 CustomTextFormFiled(
                    textInputType: TextInputType.emailAddress,
                    hint: 'E-mail',
                    controller: controllerEmail,
                    validator: (val){
                      if(val!.isEmpty){
                        return 'Please write your e-mail';
                      }
                      return null;
                    },
                    bottom: 10),
                 CustomTextFormFiled(
                  textInputType: TextInputType.visiblePassword,
                  hint: 'Password',
                  controller: controllerPassword,
                  validator: (val){
                    if(val!.isEmpty){
                      return 'Please write your password';
                    }
                    return null;
                  },
                  bottom: 10,
                  top: 0,
                 
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                      onTap: () {
                        Get.to(() => const ForgotPassword());
                      },
                      child: const Text('Forget Password')),
                ),
                const SizedBox(height: 50),
                CustomButton(
                    text: 'Login',
                    onPressed: () {
                     if (formKey.currentState!.validate()) {
                       controller.signIn(controllerEmail.text.trim(), controllerPassword.text.trim(),);
                       Get.offAll(() => HomePage());
                     }
                      //AuthService authService = AuthService();
                      // if (controller.formKey.currentState!.validate()) {
                      //   controller.login();
                      //   toastification.show(
                      //     context: context,
                      //     title: const Text("Sign Up Successfully"),
                      //     backgroundColor: const Color(0xff4CAF50),
                      //     autoCloseDuration: const Duration(seconds: 3),
                      //   );
                      //   Get.offAll(() => HomePage());
                      // } else {
                      //   toastification.show(
                      //     context: context,
                      //     title: const Text("Sign Up Failed"),
                      //     backgroundColor: const Color(0xffF44336),
                      //     autoCloseDuration: const Duration(seconds: 3),
                      //   );
                      // }
                    }),
                const SizedBox(height: 15),
                TextButton(
                    onPressed: () {
                      Get.to(() =>  SignUp());
                    },
                    child: const Text('Sign Up')),
              ],
            ),
          ),
                ]),
              )));
  }
}
