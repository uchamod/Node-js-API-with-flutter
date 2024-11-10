import 'dart:convert';

import 'package:flutter_front/models/user_model.dart';
import 'package:http/http.dart' as http;

//base url
const String baseUrl = "http://192.168.63.148:5000/api/";

class UserServices {
  //crate user
  Future<void> createNewUser(User user) async {
    try {
      final response = await http.post(Uri.parse("${baseUrl}create"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          },
          body: json.encode(user.toJson()));
      if (response.statusCode != 200) {
        print('Failed to create user: ${response.statusCode}');
        throw Exception('Failed to create user');
      } else {
        print('create user succsussfuly: ${response.statusCode}');
      }
    } catch (err) {
      print('Error creating user: $err');
      rethrow;
    }
  }

  //get all users
  Future<List<User>> getAllUser() async {
    try {
      final response = await http.get(
        Uri.parse("${baseUrl}getAllUser"),
      );
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((user) => User.fromJson(user)).toList();
      } else {
        print('Failed to create user: ${response.statusCode}');
        throw Exception('Failed to create user');
      }
    } catch (err) {
      print('Error creating user: $err');
      rethrow;
    }
  }
  //update user
  //delete user
}
