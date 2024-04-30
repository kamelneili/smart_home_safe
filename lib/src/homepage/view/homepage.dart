import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:http/http.dart' as http;

import 'package:smart_home_safe/local_push_notification.dart';
import 'package:smart_home_safe/service/remote/service_auth.dart';
import 'package:smart_home_safe/src/homepage/model/cat_model.dart';

import '../../dashboard/dashboard.dart';
import '../../login/view/login_page.dart';
import '../controller/home_controller.dart';
import '../model/home_model.dart';
import '../widgets/add_objects.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void notif() async {
    final currentuser = auth.FirebaseAuth.instance.currentUser;

    if (currentuser != null) {
      {
        DocumentSnapshot snap = await FirebaseFirestore.instance
            .collection('users')
            .doc(currentuser.uid)
            .get();
        String? token = snap['token'];
        sendNotification('Fuite détectée !!!', token!);

        setState(() {
          active = 1;
        });
        //

        //
      }
    }
  }

  int active = 0;

  @override
  void initState() {
    super.initState();

    DateTime inactive = DateTime.now().add(const Duration(days: 20));
    // TODO: implement initState
    super.initState();
    FirebaseMessaging.instance.getInitialMessage();
    FirebaseMessaging.onMessage.listen((event) {
      LocalNotificationService.display(event);
    });

    storeNotificationToken();
  }

//notif
  storeNotificationToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({'token': token}, SetOptions(merge: true));
  }

  sendNotification(String title, String token) async {
    final data = {
      'click_action': 'FLUTTER_NOTIFICATION_CLICK',
      'id': '1',
      'status': 'done',
      'message': title,
    };

    try {
      http.Response response =
          await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
              headers: <String, String>{
                'Content-Type': 'application/json',
                'Authorization':
                    'key=AAAAd5ppXKI:APA91bGCVO-8LYriOS3CAqcJxqLAOF7OfgM2ER1KYZ66zpde-GLmxmpl6oChB0qNp43NTFHEiV1MruFNwlSZi6YyicBTrhmlpVz0RNV7kL-kP3AOLuiaJMjHV2B3_rKz4b5PLDv8S1i9'
              },
              body: jsonEncode(<String, dynamic>{
                'notification': <String, dynamic>{
                  'title': title,
                  'body': 'You are followed by someone'
                },
                'priority': 'high',
                'data': data,
                'to': token
              }));

      if (response.statusCode == 200) {
        print("Yeh notificatin is sended");
      } else {
        print("Error");
      }
    } catch (e) {}
  }

  //
  final ref = FirebaseDatabase.instance.ref('projects');
  List<String> t = ["Alarme", "Fenetre", "GAZ", "LAMPE", "Vontilo"];
  // late DataSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    List imageList = [
      'assets/alarme.jpg',
      'assets/windows.jpeg',
      'assets/gaz.jpg',
      'assets/lampe.jpg',
      'assets/vontilo.jpeg',
    ];
    return GetBuilder(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () async {
                      Get.to(() => const Dashboard());
                    },
                    icon: const Icon(Icons.dashboard))
              ],
            ),
            drawer: Drawer(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 100),
                    const CircleAvatar(
                      maxRadius: 40,
                    ),
                    const SizedBox(height: 10),
                    const Text('Wahida Ismail'),
                    const SizedBox(height: 50),
                    Container(
                      width: double.infinity,
                      height: 50,
                      margin: const EdgeInsets.only(left: 0, right: 20),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Text(' Contact'),
                    ),
                    const Spacer(),
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        AuthService authService = AuthService();
                        Get.dialog(
                          AlertDialog(
                            title: const Text('Log Out'),
                            content:
                                const Text('Are you sure you want to log out?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: const Text('No'),
                              ),
                              TextButton(
                                onPressed: () {
                                  authService.signOut();
                                  Get.offAll(() => LoginPage());
                                  print('log out');
                                },
                                child: const Text('Yes'),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        margin: const EdgeInsets.only(left: 0, right: 20),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Text('Log Out'),
                      ),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
            body: models.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 200,
                          height: 150,
                          child: Image(
                            fit: BoxFit.fill,
                            image: AssetImage("assets/status.png"),
                          ),
                        ), //
                        Expanded(
                            child: FirebaseAnimatedList(
                                query: ref,
                                itemBuilder:
                                    (context, snapshot, animation, index) {
                                  print("value");
                                  print(snapshot.value);
                                  print("index");
                                  print(index);
                                  if ((snapshot.value != 0 && index == 2)) {
                                    notif();

                                    return Card(
                                      color: Colors.amber,
                                      child: ListTile(
                                        //  ali@mail.com
                                        leading: const SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: Image(
                                            fit: BoxFit.fill,
                                            image: AssetImage('assets/gaz.jpg'),
                                          ),
                                        ),
                                        title: Text(t[index]),
                                        trailing: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, bottom: 10, right: 40),
                                          child: ClipOval(
                                              child: Container(
                                                  height: 30,
                                                  width: 30,
                                                  color: Colors.red)),
                                        ),
                                      ),
                                    );
                                  } else if (snapshot.value == 0) {
                                    return Card(
                                      color: Colors.amber,
                                      child: ListTile(
                                        //  ali@mail.com
                                        leading: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: Image(
                                            fit: BoxFit.fill,
                                            image: AssetImage(imageList[index]),
                                          ),
                                        ),
                                        title: Text(t[index]),
                                        trailing: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, bottom: 10, right: 40),
                                          child: ClipOval(
                                              child: Container(
                                                  height: 30,
                                                  width: 30,
                                                  color: Colors.green)),
                                        ),
                                      ),
                                    );
                                  } else
                                    return const Text("error");
                                }))

                        //
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: models.length,
                    itemBuilder: (context, index) {
                      return Slidable(
                        startActionPane: ActionPane(
                            motion: const StretchMotion(),
                            children: [
                              SlidableAction(
                                borderRadius: BorderRadius.circular(10),
                                onPressed: (value) {
                                  controller.deleteInList(index);
                                },
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                                icon: Icons.delete_outline,
                              ),
                            ]),
                        child: Container(
                            height: 100,
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.only(left: 20),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: SizedBox(
                              child: ListTile(
                                title: Text(models[index].name),
                                subtitle: Text(models[index].code),
                                trailing: const Icon(Icons.chevron_right),
                              ),
                            )),
                      );
                    }),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Get.to(() => const AddObject());
              },
              child: const Icon(Icons.add),
            ),
          );
        });
  }
}
