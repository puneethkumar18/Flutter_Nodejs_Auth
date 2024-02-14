import 'package:flutter/material.dart';
import 'package:flutter_node_auth/screens/home_screen.dart';
import 'package:flutter_node_auth/screens/login_screen.dart';
import 'package:flutter_node_auth/screens/singnup_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case SignUpScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const SignUpScreen(),
      );
    case LoginScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const LoginScreen(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const HomeScreen(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const SignUpScreen(),
      );
  }
}
