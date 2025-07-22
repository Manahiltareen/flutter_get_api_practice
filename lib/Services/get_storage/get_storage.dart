import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class DataManager {
  static const String _userId = "userId";
  static final String _userName = 'UserName';
  static final String _userEmail = 'Email';
  static final String _userNumber = 'UserNumber';

  DataManager._privateConstructor();

  static final DataManager _instance = DataManager._privateConstructor();

  factory DataManager() => _instance;

// factory DataManager() => _instance;
// This is the most important part.
// factory → used when you don’t always return a new object.
// Instead of making a new DataManager, it returns the same one (_instance) every time.
// Whenever someone writes DataManager(), they get the same shared instance.
  final GetStorage _storage = GetStorage();

  addToken(String token) async {
    await _storage.write(_userId, token);
  }

  getToken() async {
    await _storage.read('token');
  }

  addName(String name) async {
    await _storage.write(_userName, name);
  }

  getName() async {
    final name = await _storage.read(_userName);
    return name;
  }

  removeName() async {
    await _storage.remove(_userName);
  }

  addEmail(String email) async {
    await _storage.write(_userEmail, email);
  }

  getEmail() async {
   final email= await _storage.read(_userEmail);
    return email;
  }

  removeEmail() async {
    await _storage.remove(_userEmail);
  }

  addNumber(String email) async {
    await _storage.write(_userNumber, email);
  }

  getNumber() async {
   final number= await _storage.read(_userNumber);
   return number;
  }

  removeNumber() async {
    await _storage.remove(_userNumber);
  }

}