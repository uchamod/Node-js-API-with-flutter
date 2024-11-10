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
  Future<void> updateUser(User user) async {
    try {
      final response = await http.put(
          Uri.parse("${baseUrl}updateUser/${user.id}"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          },
          body: json.encode(user.toJson()));
      if (response.statusCode == 200) {
        print('update user succsussfuly: ${response.statusCode}');
      } else {
        print('Failed to update user: ${response.statusCode}');
        throw Exception('Failed to upadate user');
      }
    } catch (err) {
      print('Error updating user: $err');
      rethrow;
    }
  }

  //delete user
  Future<void> deleteUser(String userId) async {
    try {
      final response =
          await http.delete(Uri.parse("${baseUrl}deleteUser/$userId"));
      if (response.statusCode == 200) {
        print('delete user succsussfuly: ${response.statusCode}');
      } else {
        print('Failed to create user: ${response.statusCode}');
        throw Exception('Failed to create user');
      }
    } catch (err) {
      print('Error creating user: $err');
      rethrow;
    }
  }
}
