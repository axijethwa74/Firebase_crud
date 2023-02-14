import 'package:fire_crudapp/ui/PostScreen.dart';
import 'package:fire_crudapp/utils/utils.dart';
import 'package:fire_crudapp/widgets/RoundButton.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'ReuseableTextField.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  @override
  void dispose() {
    postController.dispose();
    super.dispose();
  }

  bool Loading = false;
//creating a node //Table Post in firebase
  final databaseRef = FirebaseDatabase.instance.ref('Post');

  final name = new TextEditingController();
  final Fullname = new TextEditingController();
  final Contact = new TextEditingController();
  final info = new TextEditingController();
  final postController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            TextWidget(
              namecontroller: name,
              title: 'Name',
            ),
            SizedBox(
              height: 20,
            ),
            TextWidget(
              namecontroller: Fullname,
              title: 'Full name',
            ),
            SizedBox(
              height: 20,
            ),
            TextWidget(
              namecontroller: Contact,
              title: 'Contact',
            ),
            SizedBox(
              height: 20,
            ),
            TextWidget(
              namecontroller: info,
              title: 'Enter your Info',
            ),
            SizedBox(
              height: 20,
            ),
            TextWidget(
              namecontroller: postController,
              title: 'Write a Description...',
            ),
            SizedBox(
              height: 30,
            ),
            RoundButton(
                title: "Add",
                loading: Loading,
                onTap: () {
                  setState(() {
                    Loading = true;
                  });
                  databaseRef
                      .child(DateTime.now().millisecondsSinceEpoch.toString())
                      .set({
                    'Name': name.text.toString(),
                    "Full Name": Fullname.text.toString(),
                    "Contact": Contact.text.toString(),
                    "Info": info.text.toString(),
                    "Add": postController.text.toString(),
                  }).then((value) {
                    setState(() {
                      Loading = false;
                    });
                    Utils().toastMessage("Post Added Successfully");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PostScreen(),
                        ));
                  }).onError((error, stackTrace) {
                    setState(() {
                      Loading = false;
                    });
                    Utils().toastMessage(error.toString());
                  });
                })
          ],
        ),
      ),
    );
  }
}
