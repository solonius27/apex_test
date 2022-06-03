import 'dart:async';
import 'dart:convert';

import 'package:apex_test/helpers/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppProvider with ChangeNotifier {
  String? token;

  Future<void> doSignUp(fullname, username, email, country, pass) async {
    var url = Uri.parse(
        'https://smart-pay-mobile.herokuapp.com/api/v1/auth/register');

    try {
      var post = await http
          .post(
        url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
        body: json.encode(
          {
            "full_name": fullname,
            "username": username,
            "email": email,
            "country": country,
            "password": pass,
            "device_name": "web"
          },
        ),
      )
          .timeout(const Duration(seconds: 20), onTimeout: () {
        throw TimeoutException(
            'The connection has timed out, Check your internet and try again!');
      });

      var response = json.decode(post.body);
      //print(response);

      if (post.statusCode != 200) {
        throw HttpException("Something went wrong");
      } else {
        //return response["rates"]["$currencyCode"].toString();
      }
    } on Exception catch (e) {
      throw HttpException(e.toString());
    }
  }

  Future<String> veryemail(email) async {
    var url =
        Uri.parse('https://smart-pay-mobile.herokuapp.com/api/v1/auth/email');

    try {
      var post = await http
          .post(
        url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
        body: json.encode(
          {"email": email},
        ),
      )
          .timeout(const Duration(seconds: 20), onTimeout: () {
        throw TimeoutException(
            'The connection has timed out, Check your internet and try again!');
      });

      var response = json.decode(post.body);
      //print(response);

      if (post.statusCode != 200) {
        throw HttpException("Something went wrong");
      } else {
        //print(response["data"]["token"]);
        return response["data"]["token"];
      }
    } on Exception catch (e) {
      throw HttpException(e.toString());
    }
  }

  Future<void> verifyreceivedtoken(email, token) async {
    var url = Uri.parse(
        'https://smart-pay-mobile.herokuapp.com/api/v1/auth/email/verify');

    try {
      var post = await http
          .post(
        url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
        body: json.encode(
          {
            "email": email,
            "token": token,
          },
        ),
      )
          .timeout(const Duration(seconds: 20), onTimeout: () {
        throw TimeoutException(
            'The connection has timed out, Check your internet and try again!');
      });

      var response = json.decode(post.body);
      //print(response);

      if (post.statusCode != 200) {
        throw HttpException("Something went wrong");
      } else {
        // print(response["data"]["token"]);
        // return response["data"]["token"];
      }
    } on Exception catch (e) {
      // TODO
    }
  }

  Future<void> doSignIn(email, pass) async {
    var url =
        Uri.parse('https://smart-pay-mobile.herokuapp.com/api/v1/auth/login');

    try {
      var post = await http
          .post(
        url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
        body: json.encode(
          {
            "email": email,
            "password": pass,
            "device_name": "web",
          },
        ),
      )
          .timeout(const Duration(seconds: 20), onTimeout: () {
        throw TimeoutException(
            'The connection has timed out, Check your internet and try again!');
      });

      var response = json.decode(post.body);
      //print(response);

      if (post.statusCode != 200) {
        throw HttpException("Something went wrong");
      } else {
        token = response["data"]["token"];
        //print(token);
      }
    } on Exception catch (e) {
      throw HttpException(e.toString());
    }
  }

  Future<String> getDashboard() async {
    var url =
        Uri.parse('https://smart-pay-mobile.herokuapp.com/api/v1/dashboard');

    try {
      var post = await http.get(
        url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
      ).timeout(const Duration(seconds: 20), onTimeout: () {
        throw TimeoutException(
            'The connection has timed out, Check your internet and try again!');
      });

      var response = json.decode(post.body);
      print(response);

      if (post.statusCode != 200) {
        throw HttpException("Something went wrong");
      } else {
        return response["data"]["secret"];
      }
    } on Exception catch (e) {
      throw HttpException(e.toString());
    }
  }
}
