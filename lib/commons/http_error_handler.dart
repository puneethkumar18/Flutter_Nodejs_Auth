

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_node_auth/commons/utils.dart';
import 'package:http/http.dart' as http;

void httpErrorHandle({
  required BuildContext context,
  required http.Response response,
  required VoidCallback onSuccess,
}){
  switch(response.statusCode){
    case 200:
    onSuccess();
    case 400:
    showSnackBar(context, jsonDecode(response.body)['error']);
    case 500:
    showSnackBar(context, jsonDecode(response.body)['msg']);

  }
}