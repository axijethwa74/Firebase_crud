import 'dart:async';

import 'package:fire_crudapp/ui/LoginScreen.dart';
import 'package:fire_crudapp/ui/PostScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashServcices {
  void isLogin(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    if (user != null) {
      Timer(
        const Duration(seconds: 3),
        () => Navigator.push(
            context, MaterialPageRoute(builder: ((context) => PostScreen()))),
      );
    } else {
      Timer(
        const Duration(seconds: 3),
        () => Navigator.push(
            context, MaterialPageRoute(builder: ((context) => LoginScreen()))),
      );
    }
  }
}
