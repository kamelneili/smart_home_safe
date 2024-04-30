import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controller/smart_safe_first_controller.dart';
import 'smart_safe.dart';

class SmartSafeFirstPage extends StatelessWidget {
  const SmartSafeFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: SmartSafeFirstController(),
        builder: (context) {
          return Scaffold(
            backgroundColor: const Color(0XFFfe7171),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset("assets/ALARM.json"),
                  const Text(
                    'Attention',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Attention alert the danger situation\n there is a Gas leak',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 60),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      Get.to(() => const SmartSafe());
                    },
                    child: Container(
                      width: 200,
                      height: 200,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 0),
                            color: Colors.pink.withOpacity(0.7),
                            spreadRadius: 1,
                            blurRadius: 30,
                          ),
                          BoxShadow(
                            offset: const Offset(0, 0),
                            color: Colors.pink.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 50,
                          ),
                          BoxShadow(
                            offset: const Offset(0, 0),
                            color: Colors.pink.withOpacity(0.4),
                            spreadRadius: 1,
                            blurRadius: 70,
                          ),
                        ],
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Text(
                        ' Safe',
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0XFFfe7171),
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
