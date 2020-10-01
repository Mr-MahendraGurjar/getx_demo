import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:getx_demo/model/userResponse.dart';
import 'package:http/http.dart' as http;

class HttpHelper {

  Future<UsersResponse> getAllUserData(int page) async {
    UsersResponse usersResponse;
    String url = "https://reqres.in/api/users?page="+page.toString();
    print("url  "+url);
    try {
      http.Response response =
          await http.get(url);
      if (response.statusCode == 200) {
        usersResponse = UsersResponse.fromJson(json.decode(response.body));

      }
    } catch (e) {
      print(e.toString());
    }
    return usersResponse;
  }
}
