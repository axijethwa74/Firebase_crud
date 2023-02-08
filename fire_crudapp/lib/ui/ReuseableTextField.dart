import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  TextWidget({super.key, required this.namecontroller, required this.title});
  var namecontroller;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextFormField(
        controller: namecontroller,
        maxLines: 1,
        decoration: InputDecoration(
          hintText: title,
          border: OutlineInputBorder(),
          hintMaxLines: 4,
        ),
      ),
    );
  }
}
