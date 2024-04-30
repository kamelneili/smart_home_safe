import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class NotificationsController extends GetxController {

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  Future<void> init()async{
    messaging.getToken().then((value) {
      print(value);
    });
  }

}