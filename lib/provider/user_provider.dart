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

  //fetch all user data
  Future<void> fetchUsers() async {
    try {
      _user = await _userServices.getAllUser();
      notifyListeners(); // Notify listeners that the data has changed
    } catch (error) {
      print('Failed to fetch users: $error');
    }
  }

  //delete user data by id
  Future<void> deleteUsers(String id) async {
    try {
      await _userServices.deleteUser(id);
      _user.removeWhere((user) => user.id == id);
      notifyListeners(); // Notify listeners that the data has changed
    } catch (error) {
      print('Failed to delete users: $error');
    }
  }

  //update user by id
  Future<void> updateUsers(User user) async {
    try {
      await _userServices.updateUser(user);
      int index = _user.indexWhere((item) => item.id == user.id);
      if (index != -1) {
        _user[index] = user;
      }
      notifyListeners(); // Notify listeners that the data has changed
    } catch (error) {
      print('Failed to update users: $error');
    }
  }
}
