import "package:flutter/material.dart";
import "package:flutter_node_auth/screens/login_screen.dart";
import "package:flutter_node_auth/screens/singnup_screen.dart";

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home-screen';
  const HomeScreen({super.key});

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
            ),
          ],
        ),
      ),
      body: Center(
        child: TextButton(
          style: const ButtonStyle(
            elevation: MaterialStatePropertyAll(100),
            backgroundColor: MaterialStatePropertyAll(Colors.teal),
          ),
          child: const Text("HomeScreen",style: TextStyle(color: Colors.white),),
          onPressed: () {},
        ),
      ),
    );
  }
}
