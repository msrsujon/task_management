import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_management/ui/data/models/user_model.dart';

class AuthController {
  static String? accessToken;
  static UserModel? userModel;

  static const _accessTokenKey = 'access-Token';
  static const _userDataKey = 'User-data';

  static Future<void> saveUserData(String accessToken, UserModel model) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_accessTokenKey, accessToken);
    await sharedPreferences.setString(_userDataKey, jsonEncode(model.tojson()));
  }

  static Future<void> getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(_accessTokenKey);
    String? userData = sharedPreferences.getString(_userDataKey);
    accessToken = token;
    userModel = UserModel.fromJson(jsonDecode(userData!));
  }

  static Future<bool> isUserLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(_accessTokenKey);
    if (token != null) {
      await getUserData();
      return true;
    } else {
      return false;
    }
  }

  static Future<void> clearData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }
}
