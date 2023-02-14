import 'package:fire_crudapp/ui/LoginScreen.dart';
import 'package:fire_crudapp/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import 'Add_post_Screen.dart';

class PostScreen extends StatelessWidget {
  PostScreen({super.key});

  final auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref("Post");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Welcome"),
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
        body: Expanded(
          child: FirebaseAnimatedList(
            query: ref,
            defaultChild: CircularProgressIndicator(
              strokeWidth: 2,
              color: Colors.blue,
            ),
            itemBuilder: (context, snapshot, animation, index) {
              return Column(
                children: [
                  Text(snapshot.child('Name').value.toString()),
                ],
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddPost()));
          },
          child: Icon(Icons.add),
        ));
  }
}
