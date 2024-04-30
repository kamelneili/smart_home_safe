import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/home_model.dart';

class HomeController extends GetxController {
  TextEditingController objectName = TextEditingController();
  final models = <HomeModel>[].obs;
  final objectCode = TextEditingController();
  addToList() async {
    models.add(HomeModel(name: objectName.text, code: objectCode.text));
    Get.back();
    objectName.clear();
    update();
  }

  deleteInList(value) {
    models.removeAt(value);
    update();
  }
   
  
}
