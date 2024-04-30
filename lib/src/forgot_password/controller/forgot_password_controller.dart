import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_home_safe/service/remote/service_auth.dart';

class ForgotPassordController extends GetxController {
  TextEditingController forgot = TextEditingController();
    final formKey = GlobalKey<FormState>();
    AuthService auth = AuthService();
    void sendEmail(){
      auth.forgotPasswordByEmail(forgot.text);
      
      forgot.clear();
      Get.snackbar("Success", "Check your email");
      
    }
}
