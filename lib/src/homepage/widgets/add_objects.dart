import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/custom_button.dart';
import '../controller/home_controller.dart';

class AddObject extends StatelessWidget {
  const AddObject({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
              appBar: AppBar(
                title: const Text('Add visiteur'),
                centerTitle: true,
              ),
              body: Column(
                children: [
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 20, bottom: 0),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 30, horizontal: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: TextFormField(
                            controller: controller.objectName,
                            decoration: const InputDecoration.collapsed(
                                hintText: 'Enter Name V'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 20, bottom: 20),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 30, horizontal: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: TextFormField(
                            decoration: const InputDecoration.collapsed(
                                hintText: 'Enter Number Code'),
                          ),
                        ),
                        const SizedBox(height: 20),
                        CustomButton(
                          onPressed: () async {
                            if (controller.objectName.text == '') {
                              Get.snackbar('Wrong', 'Please write object name');
                            } else {
                              controller.addToList();
                              //await controller.addToFirebase();
                            }
                          },
                          text: 'Add',
                        )
                      ],
                    ),
                  ),
                ],
              ));
        });
  }
}
