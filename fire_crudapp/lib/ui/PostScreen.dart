import 'package:fire_crudapp/ui/LoginScreen.dart';
import 'package:fire_crudapp/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatelessWidget {
  PostScreen({super.key});

  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
        actions: [
          IconButton(
            onPressed: () {
              auth.signOut().then((value) {
                String message = " Logout ";
                Utils().toastMessage(message.toString());
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => LoginScreen())));
              }).onError((error, stackTrace) {
                Utils().toastMessage(error.toString());
              });
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Container(
        child: Center(
          child: Text(
            "Hellow World",
            style: TextStyle(fontSize: 50),
          ),
        ),
      ),
    );
  }
}
