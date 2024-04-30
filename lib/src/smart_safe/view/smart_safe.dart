import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../login/view/login_page.dart';
import '../../widgets/custom_button.dart';

class SmartSafe extends StatelessWidget {
  const SmartSafe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.chat),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0XFFc4032e), Color(0XFF181925)])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/smart_safe.json'),
            CustomButton(
              text: 'Smart Safe',
              onPressed: () {
                Get.to(() => LoginPage());
              },
            )
          ],
        ),
      ),
    );
  }
}
