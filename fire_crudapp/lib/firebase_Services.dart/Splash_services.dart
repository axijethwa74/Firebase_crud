import 'dart:async';

import 'package:fire_crudapp/ui/LoginScreen.dart';
import 'package:flutter/material.dart';

class SplashServcices {
  void isLogin(BuildContext context) {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.push(context,
          MaterialPageRoute(builder: ((context) => const LoginScreen()))),
    );
  }
}
