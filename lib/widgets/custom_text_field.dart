import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  const CustomTextField({
    super.key,
    required this.controller,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: text,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 2.0,
            color: Colors.teal,
          ),
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        focusedBorder:  OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.teal,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10)
        ),
      ),
    );
  }
}
