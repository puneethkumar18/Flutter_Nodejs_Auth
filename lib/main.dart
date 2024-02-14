import 'package:flutter/material.dart';
import 'package:flutter_node_auth/routes.dart';

import 'screens/singnup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Nodejs Authantication',
      theme: ThemeData.light(
        useMaterial3: true,
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const SignUpScreen(),
    );
  }
}


  