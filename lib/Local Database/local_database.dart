import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDb {

  static Future<bool> isLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    return isLoggedIn;
  }

  static Future<void> setLoginStatus(bool status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', status);
  }

  static Future<void> setUserFullName(String userName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', userName);
  }

  static Future<String?> getUserFullName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userName = prefs.getString('userName');
    return userName;
  }

  static Future<void> setUserAge(String userAge) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userAge', userAge);
  }
  static Future<String?> getUserAge() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userAge = prefs.getString('userAge');
    return userAge;
  }


  static Future<void> setEmailId(String userEmailId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userEmailId', userEmailId);
  }
  static Future<String?> getUserEmailId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userEmailId = prefs.getString('userEmailId');
    return userEmailId;
  }
  static Future<void> setUserAddress(String userAddress) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userAddress', userAddress);
  }
  static Future<String?> getUserAddress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userAddress = prefs.getString('userAddress');
    return userAddress;
  }
  static Future<void> setUserUID(String userUID) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userUID', userUID);
  }

  static Future<String?> getUserUID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userUID');
  }
  static Future<void> setUserProfileUid(String userProfileUid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userProfileUid', userProfileUid);
  }

  static Future<String?> getUserProfileUid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userProfileUid');
  }
  static Future<void> clearAll() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}