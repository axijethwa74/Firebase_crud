import 'package:fire_crudapp/firebase_Services.dart/Splash_services.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServcices splashservices = SplashServcices();

  @override
  void initState() {
    splashservices.isLogin(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text(
        "Firebase Crud",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      )),
    );
  }
}
