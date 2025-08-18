import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final bool isPassword;

  const Textfield({
    super.key,
    required this.hint,
    required this.controller,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(hintText: hint),
      ),
    );
  }
}
