//import 'package:http/http.dart' as http;
import 'package:firebase_messaging/firebase_messaging.dart';

class ServiceFirebaseMessages{
  // static Future<void> sendPushNotification(String token, String title, String body) async {
  //   try {
  //     await http.post(
  //       Uri.parse('https://fcm.googleapis.com/fcm/send'),
  //       headers: <String, String>{
          
  //         'Content-Type': 'application/json',
  //         'Authorization': 'key=AAAAf2SfV_I:APA91bFb6FJb7YhIqk2J1qZ0j5iP9O2eNvB7P6JqQOjOQzVq5wYh9n9JYbIjYDm9eLj9y0bGcA9tTbC9s9YQ',
        
  //       } 
  //     );
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  Future<void>requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
      NotificationSettings settings = await messaging.requestPermission(
  alert: true,
  announcement: false,
  badge: true,
  carPlay: false,
  criticalAlert: false,
  provisional: false,
  sound: true,
);

print('User granted permission: ${settings.authorizationStatus}');
  }
  static Future<void> getToken() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    String? token = await messaging.getToken();
    print(token);
  }
  Future<void> foregroundMessagesHandler()async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');
       if (message.notification != null) {
    print('Message also contained a notification: ${message.notification}');
  }
    });
  }
  static Future<void> backgroundMessagesHandler()async {
    
     FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  }
  @pragma('vm:entry-point')
static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  // await Firebase.initializeApp();
  print("Handling a background message: ${message.messageId}");
}
}