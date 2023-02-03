import 'dart:ui';

import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  RoundButton(
      {super.key,
      required this.title,
      required this.onTap,
      this.loading = false});

  String title;
  final VoidCallback onTap;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.05,
          width: MediaQuery.of(context).size.width * 0.6,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: loading
                ? CircularProgressIndicator(
                    strokeWidth: 1,
                    backgroundColor: Colors.white,
                  )
                : Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
