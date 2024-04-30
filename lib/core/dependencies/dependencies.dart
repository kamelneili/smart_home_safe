import 'package:get/get.dart';
import 'package:smart_home_safe/service/remote/auth_controller.dart';
import 'package:smart_home_safe/src/homepage/controller/home_controller.dart';

import '../../service/remote/notifications_controller.dart';

class DependenciesController implements Bindings{

  @override
   void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => AuthController());
    // notify 
    //Get.putAsync(() => NotificationsController().init());
  }

}