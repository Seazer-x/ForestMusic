import 'dart:convert';

import 'package:forest_music_app/api/request_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user.dart';

const String prefix = '/user/auth';

Future<User> login(username, passwd) async {
  final data = await RequestUtil.post(
      "$prefix/login/", {"username": username, "password": passwd});
  if (data['code'] != 200) return User.error(data);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Map jsonUser = User.fromJson(data['data']).toJson();
  prefs.setString('user', jsonEncode(jsonUser));
  return User.fromJson(data['data']);
}
