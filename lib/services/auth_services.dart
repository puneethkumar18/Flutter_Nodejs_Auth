// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_node_auth/commons/utils.dart';
import 'package:flutter_node_auth/provider/user_provider.dart';
import 'package:flutter_node_auth/screens/home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../commons/http_error_handler.dart';

class AuthServices {
  Future<void> signUp({
    required String name,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$uri/auth/sighup'),
        headers: {
          'Content Type': 'Application/json;',
        },
        body: {
          'email': email,
          'password': password,
          'name': name,
        },
      );
      httpErrorHandle(
          context: context,
          response: response,
          onSuccess: () {
            showSnackBar(context, "Account has Succesfully Created");
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<void> signIn({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$uri/auth/sighIn'),
        headers: {
          'Content Type': 'Application/json;',
        },
        body: {
          'email': email,
          'password': password,
        },
      );
      httpErrorHandle(
        context: context,
        response: response,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          Provider.of<UserProvider>(context).setUser(
            jsonDecode(response.body),
          );
          prefs.setString(
            'x-auth-token',
            jsonDecode(response.body)['token'],
          );
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (_) => const HomeScreen(),
              ),
              (route) => false);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
