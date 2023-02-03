import 'package:fire_crudapp/main.dart';
import 'package:fire_crudapp/ui/LoginScreen.dart';
import 'package:fire_crudapp/ui/PostScreen.dart';
import 'package:fire_crudapp/utils/utils.dart';
import 'package:fire_crudapp/widgets/RoundButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final userController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool Loading = false;
  final _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    emailController.dispose();
    userController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  void Signin() {
    setState(() {
      Loading = true;
    });
    _auth
        .createUserWithEmailAndPassword(
            email: emailController.text.toString(),
            password: passwordController.text.toString())
        .then((value) {
      Utils().toastMessage(value.user!.email.toString());
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ));
    }).onError((error, stackTrace) {
      Utils().toastMessage(error.toString());
      setState(() {
        Loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        hintText: "Enter your Name",
                        helperText: "enter i.e john Steff",
                        prefixIcon: Icon(Icons.verified_user),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: userController,
                      decoration: const InputDecoration(
                        hintText: "Enter your username",
                        helperText: "enter i.e johnSteff002",
                        prefixIcon: Icon(Icons.verified_rounded),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        hintText: "Enter your email",
                        helperText: "enter i.e johnSteff@gmail.com",
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                        hintText: "Enter your Password",
                        helperText: "enter i.e ******",
                        prefixIcon: Icon(Icons.lock),
                      ),
                    ),
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
            RoundButton(
                title: "Sign Up",
                loading: Loading,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    Signin();
                  }
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an Account"),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ));
                    },
                    child: Text("Login"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
