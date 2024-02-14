import 'package:flutter/material.dart';
import 'package:flutter_node_auth/screens/home_screen.dart';
import 'package:flutter_node_auth/widgets/custom_button.dart';
import 'package:flutter_node_auth/widgets/custom_text_field.dart';

import 'singnup_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login-screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60),
        child: AppBar(
          backgroundColor: Colors.teal,
          centerTitle: true,
          title: const Text(
            'Flutter Nodejs Auth',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
      drawer: Drawer(
        width: 250,
        child: Column(
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              decoration: const BoxDecoration(
                color: Colors.teal,
              ),
              height: 80,
              child: const ListTile(
                title: Text(
                  'List of Screens',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            ListTile(
              title: const Text(
                'SignUp Screen',
                style: TextStyle(fontSize: 20, color: Colors.teal),
              ),
              onTap: () {
                Navigator.pushNamed(context, SignUpScreen.routeName);
              },
            ),
            ListTile(
              title: const Text(
                'LogIn Screen ',
                style: TextStyle(fontSize: 20, color: Colors.teal),
              ),
              onTap: () {
                Navigator.pushNamed(context, LoginScreen.routeName);
              },
            ),
            ListTile(
              title: const Text(
                'Home Screen',
                style: TextStyle(fontSize: 20, color: Colors.teal),
              ),
              onTap: () {
                Navigator.pushNamed(context, HomeScreen.routeName);
              },
            )
          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
        child: Column(
          children: [
            const Text(
              'LogIn',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 20),
            CustomTextField(controller: emailController, text: 'Email'),
            const SizedBox(height: 20),
            CustomTextField(controller: passwordController, text: 'Password'),
            const SizedBox(height: 20),
            CustomBUtton(onTap: () {}, text: 'LogIn'),
          ],
        ),
      ),
    );
  }
}
