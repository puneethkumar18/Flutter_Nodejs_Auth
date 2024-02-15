import 'package:flutter/material.dart';

String uri = 'http://localhiost:3000';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
      ),
    ),
  );
}
