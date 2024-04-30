import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../core/dialogs/dailog_login.dart';
import '../../core/shared/cashHelper.dart';

class AuthService{
  FirebaseAuth auth = FirebaseAuth.instance;
  DialogLogin dialogLogin = const DialogLogin();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
    Future<void> loginByEmailAndPassword(String email, String password, BuildContext context) async {
  try {
    // Validate email format
    if (email.isEmpty || !RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b').hasMatch(email)) {
     const DialogLogin(text: 'Please enter a valid email address.',   title:  'Error',);
      return;
    }

    // Validate password length
    if (password.isEmpty || password.length < 6) {
      const DialogLogin(  text: 'Password must be at least 6 characters long.',   title:  'Error',);
      return;
    }

    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    // If login successful, save the login state
    await CashHelper.saveData(key: 'isLogin', value: true);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'wrong-password') {
      const DialogLogin(text: "Wrong password",title:  'Error',);
    } else if (e.code == 'user-not-found') {
      const DialogLogin(text: "User not found",title:  'Error',);
    } else {
      DialogLogin(text: e.toString(),title:  'Error',);
    }
  } catch (e) {
    DialogLogin(text: e.toString(),title:  'Error',);
  }
}

        void signUpByUserData(String email, String password, String name) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await firestore.collection("users").doc(userCredential.user!.uid).set({
        "email": email,
        "password": password,
        "name": name,
        "id": userCredential.user!.uid,
      });

      Get.offAllNamed("/login");
    } catch (e) {
      print("Sign up error: $e");
      // Handle error, show snackbar, etc.
    }
  }

  Future<void> signWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        UserCredential userCredential =
            await auth.signInWithCredential(GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        ));

        await firestore.collection("users").doc(userCredential.user!.uid).set({
          "email": userCredential.user!.email,
          "password": userCredential.user!.uid,
          "imageProfile": userCredential.user!.photoURL,
          "name": userCredential.user!.displayName,
          "id": userCredential.user!.uid,
        });

        Get.offAllNamed("/login");
      }
    } catch (e) {
      print("Google sign in error: $e");
      // Handle error, show snackbar, etc.
    }
  }

  void signOut() {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      auth.signOut();
    } catch (e) {
      print("Sign out error: $e");
      // Handle error, show snackbar, etc.
    }
  }
  Future<void> forgotPasswordByEmail(String email )async{
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
      try {
          auth.sendPasswordResetEmail(email: email);
          DocumentSnapshot userDoc = await firestore.collection("users").doc(email).get();
          if (userDoc.exists) {
            await firestore.collection("users").doc(email).update({
        "password": "newPassword", 
      });
      
          }
      } catch (e) {
        print("Sign out error: $e");
        print(e.toString());
      }
  }
}