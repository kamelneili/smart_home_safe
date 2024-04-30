import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_home_safe/local_push_notification.dart';
import 'core/dependencies/dependencies.dart';
import 'core/shared/cashHelper.dart';
import 'firebase_options.dart';
import 'service/remote/service_notifications.dart';
import 'src/dashboard/dashboard.dart';
import 'src/forgot_password/view/forgot_password.dart';
import 'src/homepage/view/homepage.dart';
import 'src/login/view/login_page.dart';
import 'src/sign_up/view/sign_up.dart';
import 'src/smart_safe/view/smart_safe.dart';
import 'src/smart_safe/view/smart_safe_first_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  /// On click listner
}
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CashHelper.init();
  //await GetStorage.init();
  await FirebaseMessaging.instance.setAutoInitEnabled(true);
  //await FirebaseMessaging.instance.setDeliveryMetricsExportToBigQuery(true);
  await ServiceFirebaseMessages.backgroundMessagesHandler();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  LocalNotificationService.initialize();
  //await ServiceFirebaseMessages.getToken();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var isLoged = CashHelper().getData(key: 'isLogin');
    bool checkUser = false;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Safe',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //! for smart safe
      initialBinding: DependenciesController(),
      // home: const SmartSafeFirstPage(),
      //! routes for smart safe
      routes: {
        '/': (context) => const SmartSafe(),
        '/smart_safe_first_page': (context) => const SmartSafeFirstPage(),
        'login': (context) => LoginPage(),
        'homepage': (context) => const HomePage(),
        'signup': (context) => SignUp(),
        'forgot_password': (context) => const ForgotPassword(),
        'dashboard': (context) => const Dashboard(),
        //
      },
      initialRoute: checkUser == isLoged ? '/dashboard' : '/',
    );
  }
}
 


 //**
 // options:  const FirebaseOptions(
  //        apiKey: "AIzaSyCnZf9nq7Jt5N8U7uq9VtLdDdF0cWZ2nQk",
     //     authDomain: "flutter-application-1-9a7e2.firebaseapp.com",
//projectId: "flutter-application-1-9a7e2",
     //     storageBucket: "flutter-application-1-9a7e2.appspot.com",
     //     messagingSenderId: "1040677115746",
    //      appId: "1:1040677115746:web:7a0b9b6b9d0c7b4c1e8d3f",
     //   ),
 //
 //
 // */