import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class SmartSafeFirstController extends GetxController {
  String token = '';
  getToken() async {
    await FirebaseMessaging.instance
        .getToken()
        .then((value) => token = value.toString());

    Future.delayed(const Duration(seconds: 1), () {
      print('asd $token');
    });
  }

  @override
  void onInit() {
    getToken();
    super.onInit();
  }
}
