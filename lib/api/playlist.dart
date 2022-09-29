import 'package:forest_music_app/api/request_util.dart';
import 'package:forest_music_app/model/playlist.dart';

const String prefix = '/user/playlist';
Future<Playlist> playlistdetail(id) async {
  final data = await RequestUtil.get("$prefix/get/$id");
  return Playlist.fromJson(data['data']);
}
