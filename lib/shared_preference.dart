import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'login_model.dart';

class SaveDataLocal {
  static SharedPreferences? prefs;
  static String userData = 'UserData';
  static String calenderEventData = 'CalenderEvent';
  static saveLogInData(Userdata userModel) async {
    prefs = await SharedPreferences.getInstance();
    String json = jsonEncode(userModel.toJson());
    await prefs?.setString(userData, json);
  }
  static getDataFromLocal() async {
    prefs = await SharedPreferences.getInstance();

    String? userString = prefs?.getString(userData);
    if (userString != null) {
      Map userMap = jsonDecode(userString);
      Userdata user = Userdata.fromJson(userMap);
      return user;
    } else {
      return null;
    }
  }

  static clearUserData() async {
    prefs = await SharedPreferences.getInstance();
    prefs?.clear();
  }
}