import 'package:flutter/material.dart';

class CustomBUtton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const CustomBUtton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.teal,
          minimumSize: const Size(
            double.infinity,
            50,
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      onPressed: () {},
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 17,
        ),
      ),
    );
  }
}
