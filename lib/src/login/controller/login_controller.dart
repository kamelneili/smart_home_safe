// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import 'package:smart_home_safe/service/remote/service_auth.dart';

// import '../../homepage/view/homepage.dart';

// class LoginController extends GetxController {
//   @override
//   void onInit() {
//     super.onInit();
//   }
//   //! we will use firebase  as auth service
//   AuthService authService = AuthService();

//   final email = TextEditingController();
//   final password = TextEditingController();
//   final formKey = GlobalKey<FormState>();
 
//   void login(BuildContext context) async {
//     if (formKey.currentState!.validate()) {
//       await authService
//           .loginByEmailAndPassword(email.text, password.text, context);
//       Get.offAll(() => HomePage());
//       Get.snackbar("Success", "Login Successful");
          
//     } else {
//       Get.snackbar("Error", "Please write correct details");
//     }
       

//   }

  
// }