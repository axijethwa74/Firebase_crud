import 'package:fire_crudapp/main.dart';
import 'package:fire_crudapp/ui/LoginScreen.dart';
import 'package:fire_crudapp/widgets/RoundButton.dart';
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
                      decoration: InputDecoration(
                        hintText: "Enter your Name",
                        helperText: "enter i.e john Steff",
                        prefixIcon: Icon(Icons.verified_user),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: userController,
                      decoration: InputDecoration(
                        hintText: "Enter your username",
                        helperText: "enter i.e johnSteff002",
                        prefixIcon: Icon(Icons.verified_rounded),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: "Enter your email",
                        helperText: "enter i.e johnSteff@gmail.com",
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: "Enter your Password",
                        helperText: "enter i.e ******",
                        prefixIcon: Icon(Icons.lock),
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            RoundButton(title: "Sign Up", onTap: () {}),
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
