import 'package:flutter/material.dart';
import 'package:flutter_node_auth/provider/user_provider.dart';
import 'package:flutter_node_auth/routes.dart';
import 'package:flutter_node_auth/screens/home_screen.dart';
import 'package:provider/provider.dart';

import 'screens/singnup_screen.dart';

void main() {
  MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => UserProvider())],
    child: const MyApp(),
  );
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
      home: Provider.of<UserProvider>(context).user.name.isNotEmpty
          ? const SignUpScreen()
          : const HomeScreen(),
     
    );
  }
}
