// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fire_crudapp/ui/PostScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:fire_crudapp/widgets/RoundButton.dart';

import '../utils/utils.dart';

class VerifyCode extends StatefulWidget {
  final String verficationId;
  const VerifyCode({
    Key? key,
    required this.verficationId,
  }) : super(key: key);

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

final phonenumberController = TextEditingController();

class _VerifyCodeState extends State<VerifyCode> {
  final verifycode = TextEditingController();

  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Verify Code"),
        ),
        body: Column(
          children: [
            TextFormField(
              controller: verifycode,
              decoration: InputDecoration(
                hintText: "Code",
              ),
            ),
            SizedBox(
              height: 30,
            ),
            RoundButton(
                title: "Verify your Code",
                onTap: () async {
                  // ignore: unused_local_variable
                  final credential = PhoneAuthProvider.credential(
                    verificationId: widget.verficationId,
                    smsCode: verifycode.text.toString(),
                  );
                  try {
                    await auth.signInWithCredential(credential);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => PostScreen())));
                  } catch (e) {
                    
                    Utils().toastMessage(e.toString());
                  }
                }),
          ],
        ));
  }
}
