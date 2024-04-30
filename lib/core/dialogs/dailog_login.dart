import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DialogLogin extends StatelessWidget {
  final String title ;
  //= "Wrong Password";
  final String text ;
  //= "The password is invalid or the user does not have a password.";

  const DialogLogin({super.key,
    this.title = "Wrong Password",
     this.text = "The password is invalid or the user does not have a password.",
    });
  @override
  Widget build(
    BuildContext context,
  ) {
  return AlertDialog(
    title: Text(title),
    content: Text(text),
    actions: <Widget>[
      TextButton(
        child: Text("OK"),
        onPressed: () {
            Get.back();
        }
      )
    ]
  );
}
}