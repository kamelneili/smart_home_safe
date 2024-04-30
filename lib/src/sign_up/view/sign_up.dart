import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toastification/toastification.dart';
import '../../../service/remote/service_auth.dart';
import '../../login/view/login_page.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textformfiled.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final name = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //final SignUpController signUpController = Get.put(SignUpController());

    return Scaffold(
      body: ListView(
        children:[ Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'Sign Up',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                CustomTextFormFiled(
                  textInputType: TextInputType.emailAddress,
                  controller: email,
                  hint: 'E-mail',
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Please write your e-mail';
                    }
                    return null;
                  },
                  bottom: 10,
                ),
                CustomTextFormFiled(
                  textInputType: TextInputType.visiblePassword,
                  controller: name,
                  hint: 'Name Surname',
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Please write your name';
                    }
                    return null;
                  },
                  top: 0,
                  bottom: 10,
                ),
                CustomTextFormFiled(
                  textInputType: TextInputType.visiblePassword,
                  controller: password,
                  hint: 'Password',
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Please write your password';
                    }
                    return null;
                  },
                  top: 0,
                  bottom: 10,
                ),
                const SizedBox(height: 50),
                CustomButton(
                  text: 'Sign Up',
                  onPressed: () {
                    AuthService authService = AuthService();
                    if (_formKey.currentState!.validate()) {
                     
                      authService.signUpByUserData(
                          email.text, password.text, name.text);
                      toastification.show(
                        context: context,
                        title: const Text("Sign Up Successfully"),
                        backgroundColor: const Color(0xff4CAF50),
                        autoCloseDuration: const Duration(seconds: 3),
                      );
                      Get.offAll(() => LoginPage());
                    } else {
                      toastification.show(
                        context: context,
                        title: const Text("Sign Up Failed"),
                        backgroundColor: const Color(0xffF44336),
                        autoCloseDuration: const Duration(seconds: 3),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
