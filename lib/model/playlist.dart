import 'music.dart';

class Playlist {
  final String id;
  final String name;
  final String cover;
  final String description;
  final List<Music> musicList;
  const Playlist({
    required this.id,
    required this.name,
    required this.description,
    required this.musicList,
    required this.cover,
  });
  factory Playlist.fromJson(Map<String, dynamic> json) {
    List<Music> list = [];
    json['musicList'].forEach((item) {
      list.add(Music.fromJson(item));
    });
    return Playlist(
        id: json['id'],
        name: json['name'],
        cover: json['cover'],
        description: json['description'],
        musicList: json['musicList'].isEmpty ? [] : list);
  }
}
