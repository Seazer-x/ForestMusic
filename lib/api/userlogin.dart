import 'package:forest_music_app/api/request_util.dart';

import '../model/user.dart';

const String prefix = '/user/auth';

Future<User> login(username, passwd) async {
  final data = await RequestUtil.post(
      "$prefix/login/", {"username": username, "password": passwd});
  if (data['code'] != 200) return User.error(data);
  return User.fromJson(data['data']);
}
