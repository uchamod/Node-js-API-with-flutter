import 'package:flutter/material.dart';
import 'package:flutter_front/models/user_model.dart';
import 'package:flutter_front/services/user_services.dart';

class UserProvider with ChangeNotifier {
  List<User> _user = [];
  List<User> get getAllUsers => _user;
  final UserServices _userServices = UserServices();

  //constructor
  UserProvider() {
    fetchUsers();
  }
  //crate new user
  Future<void> crateUser(User user) async {
    try {
      await _userServices.createNewUser(user);
      _user.add(user);
      notifyListeners();
    } catch (err) {
      print('Failed to add user: $err');
    }
  }

  Future<void> fetchUsers() async {
    try {
      _user = await _userServices.getAllUser();
      notifyListeners(); // Notify listeners that the data has changed
    } catch (error) {
      print('Failed to fetch users: $error');
    }
  }
}
