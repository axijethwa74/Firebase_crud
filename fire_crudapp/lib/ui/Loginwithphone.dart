import 'package:fire_crudapp/ui/verifycode.dart';
import 'package:fire_crudapp/utils/utils.dart';
import 'package:fire_crudapp/widgets/RoundButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LoginWithPhonenumber extends StatefulWidget {
  const LoginWithPhonenumber({super.key});

  @override
  State<LoginWithPhonenumber> createState() => _LoginWithPhonenumberState();
}

class _LoginWithPhonenumberState extends State<LoginWithPhonenumber> {
  final phonenumber = TextEditingController();
  bool Loading = false;

  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: phonenumber,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                hintText: "+1 234 5678 98",
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            RoundButton(
                loading: Loading,
                title: "Login",
                onTap: () {
                  // setState(() {
                  //   Loading = true;
                  // });
                  auth.verifyPhoneNumber(
                      phoneNumber: phonenumber.text.toString(),
                      verificationCompleted: (_) {
                        // setState(() {
                        //   Loading = false;
                        // });
                      },
                      verificationFailed: (e) {
                        // setState(() {
                        //   Loading = false;
                        // });
                        Utils().toastMessage(e.toString());
                      },
                      codeSent: (String verificationid, int? token) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  VerifyCode(verficationId: verificationid),
                            ));
                        // setState(() {
                        //   Loading = false;
                        // });
                      },
                      codeAutoRetrievalTimeout: (e) {
                        Utils().toastMessage(e.toString());
                        // setState(() {
                        //   Loading = false;
                        // });
                      });
                })
          ],
        ),
      ),
    );
  }
}
