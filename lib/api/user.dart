import 'package:forest_music_app/api/request_util.dart';
import 'package:forest_music_app/model/user.dart';

const String prefix = '/user/api';
Future<User> userinfo(nickname) async {
  final data = await RequestUtil.get("$prefix/userinfo/$nickname");
  return User.fromJson(data['data']);
}
