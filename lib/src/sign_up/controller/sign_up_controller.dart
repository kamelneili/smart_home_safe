import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUpController extends GetxController {
  final RxString controllerEmail = ''.obs;
  final RxString controllerPassword = ''.obs;
  final RxString controllerName = ''.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

 
}
