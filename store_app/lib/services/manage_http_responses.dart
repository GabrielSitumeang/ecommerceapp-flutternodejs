import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void manageHttpResponse({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  //Switch Statement to handle different http status codes
  switch (response.statusCode) {
    case 200: //success request
      onSuccess();
      break;
    case 400: //bad request
      showSnackBar(context, json.decode(response.body)['msg']);
      break;
    case 500: //server error
      showSnackBar(context, json.decode(response.body)['error']);
      break;
    case 201: //create successfully
      onSuccess();
      break;
  }
}

void showSnackBar(BuildContext context, String title) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(title),
    ),
  );
}
